//
//  ProfileView.swift
//  IGApp
//
//  Created by Softprodigy on 17/04/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        HStack(spacing: 6){
                            Image("profile-1")
                                .resizable()
                                .frame(width: 80, height: 80)
                            
                            Spacer()
                            
                            HStack(spacing: 16){
                                VStack{
                                    Text("49")
                                        .fontWeight(.semibold)
                                    Text("posts")
                                        .fontWeight(.medium)
                                }
                                .foregroundColor(.black.opacity(0.8))
                                VStack{
                                    Text("150")
                                        .fontWeight(.semibold)
                                    Text("followers")
                                        .fontWeight(.medium)
                                }
                                VStack{
                                    Text("319")
                                        .fontWeight(.semibold)
                                    Text("following")
                                        .fontWeight(.medium)
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading,spacing: 1){
                            Text("John Doe")
                            Text("Coder | learner")
                        }
                        .fontWeight(.regular)
                        .padding(.horizontal)
                        
                        HStack(spacing: 2){
                            NavigationLink(value: "", label: {
                                Text("Edit Profile")
                                
                            })
                            .frame(width: UIScreen.main.bounds.width/2.5)
                            .padding(.vertical,5)
                            .background(.gray.opacity(0.8))
                            .cornerRadius(6)
                            
                            NavigationLink(value: "", label: {
                                Text("Share Porfile")
                                
                            })
                            .frame(width: UIScreen.main.bounds.width/2.5)
                            .frame(width: UIScreen.main.bounds.width/2.5)
                            .padding(.vertical,5)
                            .background(.gray.opacity(0.8))
                            .cornerRadius(6)
                            NavigationLink(value: "", label: {
                                Image(systemName: "person.badge.plus")
                                
                            })
                            .padding(.vertical,5)
                            .padding(.horizontal, 6)
                            .background(.gray.opacity(0.8))
                            .cornerRadius(6)
                        }
                        .frame(width: .infinity)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        
                    }
                    
                    TabBarSection(tabIndex: 0)
                    Spacer()
                }
                .navigationTitle("Profile")
                
                .toolbar {
                    Button(action: {
                        AuthService.shared.signout()
                    }, label: {
                        Text("signout")
//                        Image(systemName:  "signout")
                    })
                                }
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
