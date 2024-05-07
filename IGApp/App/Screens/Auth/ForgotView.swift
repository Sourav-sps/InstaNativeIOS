//
//  ForgotView.swift
//  IGApp
//
//  Created by Softprodigy on 01/05/24.
//

import SwiftUI

struct ForgotView: View {
    @State private var password = ""
    @State  private var confirmPassword = ""
    var body: some View {
        VStack{
            TextField("Enter password...", text: $password)
                .autocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
                .padding(.vertical)
            
            
            
            TextField("Enter confirm password...", text: $confirmPassword)
                .autocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
                            
            
            NavigationLink(destination: {
                AddUsername()
            }, label: {
                Text("Change password")
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

struct ForgotView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotView()
    }
}
