//
//  ReelsView.swift
//  IGApp
//
//  Created by Softprodigy on 25/04/24.
//

import SwiftUI
import AVKit

struct ReelsView: View {
    @State private var currentIndex = 0
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(mediaJSON) { item in
                    ReelView(mediaItem: item)
                        .frame(width: UIScreen.main.bounds.width)
                        .id(item.id)
                }
            }
        }
        .content.offset(x: CGFloat(currentIndex) * UIScreen.main.bounds.width)
        .background(Color.black)
        .gesture(
            DragGesture()
                .onEnded { value in
                    let offset = value.translation.width
                    let newIndex = currentIndex + (offset > 0 ? -1 : 1)
                    currentIndex = min(max(newIndex, 0), mediaJSON.count - 1)
                }
        )
    }
}

struct ReelView: View {
    var mediaItem: MediaItem
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ReelPlayerView(url: mediaItem.sources.first ?? "")
            
            // Content and Text
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    Text(mediaItem.title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(mediaItem.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
            
                .padding()
                .background(Color.black.opacity(0.5))
            }
        }
    }
}

struct ReelPlayerView: View {
    var url: String
    @State private var isPlaying = false
    private var player: AVPlayer
    
    init(url: String) {
        self.url = url
        self.player = AVPlayer(url: URL(string: url)!)
    }
    
    var body: some View {
        VideoPlayer(player: player) {
            VStack {
                if !isPlaying {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .onTapGesture {
                            isPlaying.toggle()
                            if isPlaying {
                                player.play()
                            }
                        }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .onAppear {
//            player.play()
            isPlaying = true
        }
        .onDisappear {
            player.pause()
            isPlaying = false
        }
    }
}

struct ReelsView_Previews: PreviewProvider {
    static var previews: some View {
        ReelsView()
    }
}
