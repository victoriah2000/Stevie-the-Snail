//
//  File.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 6/17/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import Foundation
import AVFoundation

extension AVPlayer {
    convenience init?(url: URL) {
        let playerItem = AVPlayerItem(url: url)
        self.init(playerItem: playerItem)
    }
    convenience init?(name: String, extension ext: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
            return nil
        }
        self.init(url: url)
    }
    func playFromStart() {
        seek(to: CMTimeMake(0, 1))
        play()
    }
    func playLoop() {
        playFromStart()
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            self.seek(to: kCMTimeZero)
            self.play()
        }
    }
    func endLoop() {
        pause()
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
}
