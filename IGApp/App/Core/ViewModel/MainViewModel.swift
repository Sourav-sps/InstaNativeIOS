//
//  MainViewModel.swift
//  IGApp
//
//  Created by Softprodigy on 03/05/24.
//

import Foundation
import FirebaseAuth
import Combine


class MainViewModel: ObservableObject{
    private let service = AuthService.shared
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserData?
    
    init(){
        self.setUp()
    }
    
    func setUp(){
        service.$userSession.sink{ [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink{ [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
