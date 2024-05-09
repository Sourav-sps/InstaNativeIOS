//
//  SearchViewModel.swift
//  IGApp
//
//  Created by Softprodigy on 07/05/24.
//

import Foundation



class SearchViewModel:ObservableObject{
    @Published var users  = [UserData]()
    
    init(){
        Task{try await fetchAllUsers()}
    }
    
    @MainActor
    func fetchAllUsers() async throws{
        self.users =  try await UserService.fetchAllUsers()
    }
}
