//
//  VideoPlayer.swift
//  IGApp
//
//  Created by Softprodigy on 19/04/24.
//

import SwiftUI
import AVFoundation


struct VideoPlayerView: UIViewRepresentable {
    var videoURL: URL

    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero, videoURL: videoURL)
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()

    init(frame: CGRect, videoURL: URL) {
        super.init(frame: frame)

        let player = AVPlayer(url: videoURL)
        playerLayer.player = player
        layer.addSublayer(playerLayer)

        player.play()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}


