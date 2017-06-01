//
//  TitleViewController.swift
//  Stevie the Snail
//
//  Created by Joshua Homann on 5/13/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    @IBOutlet var rainbowImageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animation = CABasicAnimation(keyPath: "transform")
        let translation = CATransform3DTranslate(CATransform3DIdentity, 0, rainbowImageView.bounds.size.height / 2, 0)
        let rotation = CATransform3DRotate(translation, -CGFloat.pi, 0, 0, 1)
        animation.fromValue = CATransform3DTranslate(rotation, 0, -rainbowImageView.bounds.size.height / 2, 0)
        
        animation.toValue = CATransform3DIdentity
        animation.isCumulative = true
        animation.duration = 5
        rainbowImageView.layer.add(animation, forKey: "spin")
    }
    
}
