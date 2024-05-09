//
//  ContentView.swift
//  IGApp
//
//  Created by Softprodigy on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MainViewModel()
    
    
    var body: some View {
        let _ = print("viewModel.userSession=>\(viewModel.userSession)")
        VStack {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(LoginViewModel())
            } else if let currentUser = viewModel.currentUser {
                
                MainView(user: currentUser)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
