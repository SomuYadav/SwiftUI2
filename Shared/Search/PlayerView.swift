//
//  PlayerView.swift
//  SwiftUI2
//
//  Created by Apple on 13/07/20.
//

import Foundation
import UIKit
import AVKit

class PlayerView: UIImageView {
    private let playerLayer = AVPlayerLayer()
    private var previewTimer:Timer?
    var previewLength:Double
    
    init(frame: CGRect, url: URL, previewLength:Double) {
        self.previewLength = previewLength
        super.init(frame: frame)
        
        // Create the video player using the URL passed in.
        let player = AVPlayer(url: url)
        player.volume = 0 // Will play audio if you don't set to zero
        player.play() // Set to play once created
        // Add the player to our Player Layer
        playerLayer.player = player
        
        playerLayer.videoGravity = .resizeAspectFill // Resizes content to fill whole video layer.
        playerLayer.backgroundColor = UIColor.black.cgColor
        
        previewTimer = Timer.scheduledTimer(withTimeInterval: previewLength, repeats: true, block: { (timer) in
            player.seek(to: CMTime(seconds: 0, preferredTimescale: CMTimeScale(1)))
        })
        

        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        self.previewLength = 15
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    class func generateThumbnail(path: URL) -> UIImage? {
        do {
            let asset = AVURLAsset(url: path, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
}

