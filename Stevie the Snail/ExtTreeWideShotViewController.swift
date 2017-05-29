//
//  ExtTreeWideShotViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

class ExtTreeWideShotViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet var ButterflyEffect: [UIImageView]!
    @IBOutlet var backgroundView: UIImageView!
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
        view.sendSubview(toBack: backgroundView)
        
    }
    
    deinit {
    }
    @IBAction func longPress(_ recognizer: UILongPressGestureRecognizer) {
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
    // MARK: IBAction

}
