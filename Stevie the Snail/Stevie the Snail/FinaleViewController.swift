//
//  FinaleViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit
import AVFoundation

class FinaleViewController: UIViewController {
    
    //Mark Sounds
    var sunSound = AVPlayer(name: "sunflourish", extension: "mp3")!
    var orangeSound = AVPlayer(name: "orange", extension: "mp3")!
    
    @IBAction func sunButton(_ sender: UIButton) {
        sunSound.playFromStart()
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = 2 * CGFloat.pi
        animation.isCumulative = true
        animation.duration = 0.5
        sender.layer.add(animation, forKey: "spin")
        
    }
    
    @IBOutlet var orange: UIImageView!
    var animator:  UIDynamicAnimator!
    var collision = UICollisionBehavior()
    var gravity = UIGravityBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: view)
        butterflyAnimator = UIDynamicAnimator(referenceView: view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        animator.addBehavior(gravity)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            self.collision.addItem(self.orange)
            self.gravity.addItem(self.orange)
        }
        Timer.scheduledTimer(withTimeInterval: 1 + 0.75, repeats: false) {_ in
            self.orangeSound.playFromStart()
        }
    }
    
    
    // MARK: Butterflies
    @IBOutlet var butterflyEffect: [UIImageView]!
    // MARK: Variables
    var butterflyAnimator: UIDynamicAnimator!
    var butterflyGravity: UIFieldBehavior?
    var views: [UIView] = []
    // MARK: Constants
    let minimumRadius: CGFloat = 60
    let radius: CGFloat = 1028
    let strength: CGFloat = 800
    let fallOff: CGFloat = 1
    let damping: CGFloat = 1
    // MARK: UIViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard views.count == 0 else {
            return
        }
        butterflyEffect.forEach { view in
            let snapBehavior = UISnapBehavior(item: view, snapTo: view.center)
            snapBehavior.damping = damping
            butterflyAnimator.addBehavior(snapBehavior)
        }
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
            butterflyAnimator.addBehavior(gravity)
            self.butterflyGravity = gravity
        case .changed:
            butterflyGravity?.position = recognizer.location(in: view)
        case .ended, .cancelled:
            if let gravity = butterflyGravity {
                butterflyAnimator.removeBehavior(gravity)
            }
        default:
            break
        }
    }
}

