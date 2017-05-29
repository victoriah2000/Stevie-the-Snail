//
//  ExtWideAngleToViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

class ExtWideAngleToViewController: UIViewController {
    @IBAction func sunButton(_ sender: UIButton) {
    }
    
    @IBAction func tapSun(_ sender: UIButton) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = 2 * CGFloat.pi
        animation.isCumulative = true
        animation.duration = 0.5
        sender.layer.add(animation, forKey: "spin")
        
    }
    
}


