//
//  AddEmail.swift
//  IGApp
//
//  Created by Softprodigy on 30/04/24.
//

import SwiftUI

struct AddEmail: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    var body: some View {
        VStack{
            Text("Add your email")
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .font(.title3)
                
            Text("You'll use this email to sign up to your account")
                .foregroundColor(Color(.systemGray2))
                .font(.subheadline)
                .padding(.top, 1)
            
            TextField("Enter email...", text: $viewModel.email)
                .autocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
                .padding(.vertical)
            
            
            NavigationLink(destination: {
                AddUsername()
                    .environmentObject(viewModel)
            }, label: {
                
                
        
                Text("Next")
                    .font(.body)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(width:360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
                    .padding(.horizontal,24)
            })
            .padding(.vertical)
            
            
            Spacer()
        }
        .padding(.top, 20)
    }
}

struct AddEmail_Previews: PreviewProvider {
    static var previews: some View {
        AddEmail()
    }
}
