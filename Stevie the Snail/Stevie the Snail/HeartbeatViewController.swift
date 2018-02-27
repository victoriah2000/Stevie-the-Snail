//
//  HeartbeatViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit
import AVFoundation

class HeartbeatViewController: UIViewController {
    @IBOutlet var heartBeat: UIImageView!
     var heartbeatSound = AVPlayer(name:  "heartbeat", extension: "mp3")!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        heartBeatAnimation()
        heartbeatSound.playLoop()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        heartbeatSound.endLoop()
    }
    
    func heartBeatAnimation() {
        UIView.animate(withDuration: 3.0/8.0, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.heartBeat.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: { _ in
            UIView.animate(withDuration: 5.0/8.0, delay: 0, options: [.curveEaseInOut], animations: {
                self.heartBeat.transform = .identity
            }, completion: { _ in
                self.heartBeatAnimation()
            })
        })
    }

}
