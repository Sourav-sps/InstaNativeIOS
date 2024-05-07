//
//  LoginViewModel.swift
//  IGApp
//
//  Created by Softprodigy on 06/05/24.
//

import Foundation


class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func loginWithEmail() async throws{
        try? await AuthService.shared.login(withEmail: email, password: password)
    }
}
