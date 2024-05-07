//
//  CreatePassword.swift
//  IGApp
//
//  Created by Softprodigy on 30/04/24.
//

import SwiftUI

struct CreatePassword: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    var body: some View {
        VStack{
            Text("Create a password")
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .font(.title3)
                
            Text("Create a password for login to your account")
                .foregroundColor(Color(.systemGray2))
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.top, 1)
            
            TextField("Create password...", text: $viewModel.password)
                .autocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.vertical)
            
            
            Button(action: {
                Task{ try? await viewModel.createUser()}
            }, label: {
                Text("Finish")
                    .font(.body)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width-48, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            })
            .padding(.vertical)
            
            Spacer()
        }
        .padding(.top, 20)
        .padding(.horizontal, 24)    }
}

struct CreatePassword_Previews: PreviewProvider {
    static var previews: some View {
        CreatePassword()
    }
}
