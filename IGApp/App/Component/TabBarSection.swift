//
//  TabBarSection.swift
//  IGApp
//
//  Created by Softprodigy on 18/04/24.
//

import SwiftUI

struct ImageSection:View{
    let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    var body: some View{
        VStack{
            LazyVGrid(columns: gridItems, spacing: 1){
                ForEach(0 ... 15, id:\.self){ element in
                    Image("view-1")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}
struct ReelSection: View {
    let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(0 ... 15, id: \.self) { _ in
                if let videoURL = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
                    VideoPlayerView(videoURL: videoURL)
                        .aspectRatio(16/9, contentMode: .fill)
                } else {
                    Text("Invalid URL")
                }
            }
        }
        .padding(1) // Add padding to separate grid items
    }
}



struct ProfileSection: View{
    var body: some View{
        VStack{
            
        }
    }
}


struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        
        VStack{
            Image(systemName: text)
                .resizable()
                .frame(width: 30, height: 30)
            
        }
        .overlay(
                Rectangle()
                    
                    .frame(width: 90, height: isSelected ? 2 : 0) // Adjust the height of the border
                    .foregroundColor(Color.black) // Adjust the color of the border
                    .alignmentGuide(.bottom) { d in d[.bottom] } // Align the border to the bottom
                    .padding(.top, 40)
            )
        
    }
}


struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            
            TabBarButton(text: "circle.grid.2x2", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }
            Spacer()
            TabBarButton(text: "circle.grid.3x3.circle", isSelected: .constant(tabIndex == 1))
                .onTapGesture { onButtonTapped(index: 1) }
            Spacer()
            TabBarButton(text: "person.circle", isSelected: .constant(tabIndex == 2))
                .onTapGesture { onButtonTapped(index: 2) }
            Spacer()
            
        }
    }


    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}
    

struct TabBarSection: View {
    @State var tabIndex:Int
    var body: some View {
        VStack{
            VStack{
                CustomTopTabBar(tabIndex: $tabIndex)
            }
            .padding(.vertical)
                    if tabIndex == 0 {
                        ImageSection()
                    }
                    else if tabIndex == 1 {
                        ReelSection()
                    }
                   else {
                       ProfileSection()
                    }
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 24, alignment: .center)
                .padding(.horizontal, 12)
            }
    }


struct TabBarSection_Previews: PreviewProvider {
    static var previews: some View {
        TabBarSection(tabIndex: 1 )
    }
}
