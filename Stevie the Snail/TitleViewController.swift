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
        rainbowImageView.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        rainbowImageView.frame.origin.y += rainbowImageView.bounds.size.height / 2
        rainbowImageView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        UIView.animate(withDuration: 3) {
            self.rainbowImageView.transform = .identity
        }
    }
    
}
