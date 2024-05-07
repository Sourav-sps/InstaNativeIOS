//
//  AddUsername.swift
//  IGApp
//
//  Created by Softprodigy on 30/04/24.
//

import SwiftUI

struct AddUsername: View {

    @EnvironmentObject var viewModel: RegisterViewModel
    var body: some View {
        VStack{
            Text("Create username")
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .font(.title3)
                
            Text("Pick a username for your new account. you can change it later")
                .foregroundColor(Color(.systemGray2))
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.top, 1)
            
            TextField("Enter username...", text: $viewModel.username)
                .autocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.vertical)
            
            
            NavigationLink(destination: {
                CreatePassword()
                    .environmentObject(viewModel)
            }, label: {
                Text("Next")
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
        .padding(.horizontal, 24)
    }
}

struct AddUsername_Previews: PreviewProvider {
    static var previews: some View {
        AddUsername()
    }
}
