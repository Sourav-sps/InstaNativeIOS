//
//  RegisterViewModel.swift
//  IGApp
//
//  Created by Softprodigy on 03/05/24.
//

import Foundation


class RegisterViewModel:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    
    
    
    func createUser() async throws{
       try? await AuthService.shared.register(email: email, password: password, username: username)
    }
}
