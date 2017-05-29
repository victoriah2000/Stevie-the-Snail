//
//  HeartbeatViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

class HeartbeatViewController: UIViewController {
    @IBOutlet var heartBeat: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        heartBeatAnimation()
    }
    
    func heartBeatAnimation() {
        UIView.animate(withDuration: 0.50, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.heartBeat.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: { _ in
            UIView.animate(withDuration: 0.50, delay: 0, options: [.curveEaseInOut], animations: {
                self.heartBeat.transform = .identity
            }, completion: { _ in
                self.heartBeatAnimation()
            })
        })
    }

}
