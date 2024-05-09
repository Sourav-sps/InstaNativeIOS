//
//  PostView.swift
//  IGApp
//
//  Created by Softprodigy on 17/04/24.
//

import SwiftUI

struct PostView: View {
   
    var body: some View {
        ScrollView{
            VStack(spacing: 26){
                ForEach(0...15, id: \.self){ element in
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.blue, lineWidth: 2)
                                        .frame(width: 50, height: 50)
                                )
                            VStack(alignment: .leading,spacing: 2){
                                Text("Person 1")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black.opacity(0.8))
                                Text("Person@yopmail.com")
                                    .foregroundColor(.black.opacity(0.8))
                                 }
                            .padding(.horizontal)
                            Spacer()
                        }
                        .padding(.horizontal)
                        //image view
                        Image("nature")
                            .resizable()
                            .frame(width: .infinity, height: UIScreen.main.bounds.height/2)
                        
                        
                        //card footer
                        HStack{
                            Button(action: {}, label: {
                                Image(systemName: "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                            })
                            
                            Button(action: {}, label: {
                                Image(systemName: "bubble.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            })
                            .padding(.horizontal)
                            
                            Button(action: {}, label: {
                                Image(systemName: "paperplane")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            })
                            
                            Spacer()

                        }
                        .foregroundColor(.black)
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        
                        
                        //Liked section
                        HStack(spacing: 0){
                            HStack(spacing: 2){
                                ForEach(Array(userData.enumerated()), id: \.element) { index, profile in
                                    ZStack {
                                        CircularProfileView(smallImage: true, user: profile)
                                            .frame(width: 30, height: 30)
                                            .offset(x: CGFloat(index == 0 ? 0 : -15 * index))
                                            .zIndex(Double(userData.count - index))
                                    }
                                }
                            }
                            .frame(width:45)
                            .padding(.leading,40)
                            
                            
                                ForEach(Array(userData[0..<2].enumerated()), id: \.element) { index, profile in
                                    Text(index == 0 ? " Liked by " + profile.name : " and Others")
                                }
                                .font(.system(size: 14))
                            
                            Spacer()
                            
                            
                        }
                        
                        Text("8 hours ago")
                            .font(.system(size:14))
                            .foregroundColor(.black.opacity(0.5))
                            .padding(EdgeInsets(top: 2, leading: 20, bottom: 0, trailing: 5))
                    }
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
