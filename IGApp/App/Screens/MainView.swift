//
//  MainView.swift
//  IGApp
//
//  Created by Softprodigy on 17/04/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedIndex = 0;
    
    var body: some View {
        TabView(selection: $selectedIndex){
            PostView()
                .onAppear{
                    self.selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "house")
                }
                .tag(0)
            
            UserListView()
                .onAppear{
                    self.selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            UploadView(tabIndex: $selectedIndex)
                .onAppear{
                    self.selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "plus")
                }
                .tag(2)
            ReelsView()
                .onAppear{
                    self.selectedIndex = 3
                }
                .tabItem{
                    Image(systemName: "heart")
                }
                .tag(3)
            ProfileView()
                .onAppear{
                    self.selectedIndex = 4
                }
                .tabItem{
                    Image(systemName: "person")
                }
                .tag(4)
            
        }
        .accentColor(.black)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
