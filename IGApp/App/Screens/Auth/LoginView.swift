//
//  LoginView.swift
//  IGApp
//
//  Created by Softprodigy on 30/04/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var environmentVar = RegisterViewModel()
    
    @StateObject var viewModel =  LoginViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 70)
                
                VStack{
                    TextField("Enter username...", text:$viewModel.email)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    TextField("Enter password...", text: $viewModel.password)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    
                    
                    NavigationLink(destination: {
                        ForgotView()
                    }, label: {
                        Text("Forgot password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.trailing, 26)
                            .padding(.top,6)
                            
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    
                    Button(action: {
                        Task {try await viewModel.loginWithEmail()}
                    }, label: {
                        Text("Login")
                            .font(.body)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .frame(width:360, height: 44)
                            .background(Color(.systemBlue))
                            .cornerRadius(8)
                            .padding(.horizontal,24)
                    })
                    .padding(.vertical)
                    
                        
                    HStack{
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width/2)-40, height: 0.5)
                        
                        Text("Or")
                            .font(.subheadline)
                        
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width/2)-40, height: 0.5)

                            
                    }
                    .foregroundColor(.gray)
                    
                    
                    HStack{
                        Image("fb")
                            .resizable()
                            .frame(width: 20, height:20)
                        Text("Continue with facebook")
                            .foregroundColor(Color(.systemBlue))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                        
                }
                
                Spacer()
                
                Divider()
                NavigationLink(destination: {
                    AddEmail()
                        .environmentObject(environmentVar)
                }, label: {
                    
                    HStack{
                        Text("Don't have an account?")
                            
                        Text("Signup")
                            .fontWeight(.semibold)
                    }
                    .font(.subheadline)
                    .padding(.top, 6)
                })
                
    
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
