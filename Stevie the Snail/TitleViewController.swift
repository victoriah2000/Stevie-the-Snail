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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rainbowImageView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 3,
                       delay: 0.25,
                       options: [],
                       animations: {self.rainbowImageView.transform = .identity},
                       completion: nil)
    }
    
}
