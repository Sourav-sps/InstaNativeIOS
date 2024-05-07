//
//  UserListView.swift
//  IGApp
//
//  Created by Softprodigy on 30/04/24.
//

import SwiftUI

struct UserListView: View {
    @State private var searchString = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(0...25, id: \.self){ item in
                    LazyVStack{
                        HStack{
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading){
                                Text("Akash singh")
                                    .foregroundColor(.black.opacity(0.9))
                                    
                                Text(verbatim: "Akash@yopmail.com")
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 2)
                            
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 5)
                }
                .padding(.top, 5)
                .searchable(text: $searchString, prompt: "Search...")
            }
            
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
