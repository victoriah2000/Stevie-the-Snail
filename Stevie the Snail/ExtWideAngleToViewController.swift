//
//  ExtWideAngleToViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

class ExtWideAngleToViewController: UIViewController {
    @IBOutlet var beeFly: BeeAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fly()
    }
    
    func fly() {
        beeFly.addFlyAnimation() { _ in
            self.fly()
        }
    }
    
    @IBOutlet var grasshopperJump: UIImageView!
    @IBAction func sunButton(_ sender: UIButton) {
    }
    
    @IBAction func tapSun(_ sender: UIButton) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = 2 * CGFloat.pi
        animation.isCumulative = true
        animation.duration = 0.5
        sender.layer.add(animation, forKey: "spin")
        
    }
    
    @IBAction func tapGrasshopper(_ sender: Any) {
        UIView.animate(withDuration: 0.125, delay: 0, options: [.curveEaseOut], animations: {
            self.grasshopperJump.transform = CGAffineTransform(translationX: 0, y: -3*self.grasshopperJump.bounds.size.height)
        }, completion: { _ in
            UIView.animate(withDuration: 0.125, delay: 0, options: [.curveEaseIn], animations: {
                self.grasshopperJump.transform = .identity
            }, completion: { _ in
                
            })
        })
        
    }
}


