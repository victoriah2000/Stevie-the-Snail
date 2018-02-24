//
//  GardenArrivalViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit
import AVFoundation

class GardenArrivalViewController: UIViewController {
    
    //MARK: Sounds
    var daisySound = AVPlayer(name:  "twinkle", extension: "mp3")!
    
    @IBAction func daisySpin(_ sender: Any) {
        daisySound.playFromStart()
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = 2 * CGFloat.pi
        animation.isCumulative = true
        animation.duration = 0.5
        (sender as AnyObject).layer.add(animation, forKey: "spin")
    }
    //MARK: ButterflyEffect
    
    @IBOutlet var butterflyEffect: [UIImageView]!
    
    
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
        butterflyEffect.forEach { view in
            let snapBehavior = UISnapBehavior(item: view, snapTo: view.center)
            snapBehavior.damping = damping
            animator.addBehavior(snapBehavior)
        }
        
        
    }
    
    deinit {
    }
    
    
    @IBAction func longPress(_ recognizer: UILongPressGestureRecognizer) {
        switch recognizer.state {
        case .began:
            let gravity = UIFieldBehavior.radialGravityField(position: recognizer.location(in: view))
            gravity.region = UIRegion(radius: radius)
            gravity.minimumRadius = minimumRadius
            butterflyEffect.forEach{ gravity.addItem($0) }
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
}
