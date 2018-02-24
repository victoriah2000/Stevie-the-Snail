//
//  GardenCloseUpViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit
import AVFoundation

class GardenCloseUpViewController: UIViewController {

    @IBOutlet var ButterflyEffect: [UIImageView]!
    @IBOutlet var grasshopperJump: UIImageView!
    
    //MARK sounds
     var hopSound = AVPlayer(name:  "hop", extension: "mp3")!

    
    // MARK: Variables
    var animator: UIDynamicAnimator!
    var gravity: UIFieldBehavior?
    var views: [UIView] = []
    // MARK: Constants
    let minimumRadius: CGFloat = 60
    let radius: CGFloat = 1028
    let strength: CGFloat = 800
    let fallOff: CGFloat = 1
    let damping: CGFloat = 1
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard views.count == 0 else {
            return
        }
        ButterflyEffect.forEach { view in
            let snapBehavior = UISnapBehavior(item: view, snapTo: view.center)
            snapBehavior.damping = damping
            animator.addBehavior(snapBehavior)
        }
       
        
    }
    
    deinit {
    }
    //MARK:Grasshopper
    
    @IBAction func longPress(_ recognizer: UILongPressGestureRecognizer) {
        guard !grasshopperJump.bounds.contains( recognizer.location(in: grasshopperJump))else {
            tapGrasshopper(recognizer)
            recognizer.isEnabled = false
            recognizer.isEnabled = true
            return
        }
        switch recognizer.state {
        case .began:
            let gravity = UIFieldBehavior.radialGravityField(position: recognizer.location(in: view))
            gravity.region = UIRegion(radius: radius)
            gravity.minimumRadius = minimumRadius
            ButterflyEffect.forEach{ gravity.addItem($0) }
            gravity.strength = recognizer.numberOfTouches % 2 == 0 ? -strength : strength
            gravity.falloff = fallOff
            animator.addBehavior(gravity)
            self.gravity = gravity
        case .changed:
            gravity?.position = recognizer.location(in: view)
        case .ended, .cancelled:
            if let gravity = gravity {
                animator.removeBehavior(gravity)
            }
        default:
            break
        }
        
    }
    @IBAction func tapGrasshopper(_ sender: Any) {
        hopSound.playFromStart()
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



