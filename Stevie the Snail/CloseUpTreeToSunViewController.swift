//
//  CloseUpTreeToSunViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 3/18/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

class CloseUpTreeToSunViewController: UIViewController {

    @IBOutlet var sunButton: UIButton!
    
    @IBAction func tapSun(_ sender: Any) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = 2 * CGFloat.pi
        animation.isCumulative = true
        animation.duration = 0.5
        sunButton.layer.add(animation, forKey: "spin")
    }

}
