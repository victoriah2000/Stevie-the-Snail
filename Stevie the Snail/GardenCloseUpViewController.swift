//
//  GardenCloseUpViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

class GardenCloseUpViewController: UIViewController {

    @IBOutlet var grasshopperJump: UIImageView!
    
    
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



