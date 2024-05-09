//
//  UserListView.swift
//  IGApp
//
//  Created by Softprodigy on 30/04/24.
//

import SwiftUI

struct UserListView: View {
    @State private var searchString = ""
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(viewModel.users, id: \.self){ item in
                    LazyVStack{
                        
                        NavigationLink(destination: {
                            ProfileView(user: item)
                        }, label:{
                            HStack{
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .foregroundColor(.black.opacity(0.9))
                                        
                                    Text(verbatim: item.email!)
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal, 2)
                                
                                
                                Spacer()
                            }
                            .padding(.horizontal)

                        })
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
