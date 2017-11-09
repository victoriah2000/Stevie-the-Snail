//
//  NightViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit
import AVFoundation

class NightViewController: UIViewController {
    //mark josh rock and animation
    @IBOutlet weak var Josh: UIButton!
    var joshSound = AVPlayer(name: "Boing", extension: "wav")!
    
    @IBAction func tapJosh(_ sender: UIButton) {
        
        joshSound.playFromStart()
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
            self.Josh.transform = CGAffineTransform(rotationAngle: 5)
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
                self.Josh.transform = CGAffineTransform(rotationAngle: -5)
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
                    self.Josh.transform = CGAffineTransform.identity
                }, completion: nil)
               
                
            })
        })
    }
    
    @IBOutlet var clouds: UIImageView!
    @IBOutlet var stars1: UIImageView!
    @IBOutlet var stars2: UIImageView!
    @IBOutlet var stars3: UIImageView!
    override func viewDidLoad() {
     super.viewDidLoad()
        clouds.addMotionDisplacement(xAxisAmount: 100, yAxisAmount: 100)
        stars1.addMotionDisplacement(xAxisAmount: 25, yAxisAmount: 25)
        stars2.addMotionDisplacement(xAxisAmount: 25, yAxisAmount: 25)
        stars3.addMotionDisplacement(xAxisAmount: 25, yAxisAmount: 25)
    }

}

