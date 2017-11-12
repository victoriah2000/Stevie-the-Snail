//
//  NightViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMotion

class NightViewController: UIViewController {
    //mark variables collection view
    @IBOutlet var stars: [UIImageView]!
    //mark variables for clouds parallax
    @IBOutlet var clouds: UIImageView!
    @IBOutlet var stars1: UIImageView!
    @IBOutlet var stars2: UIImageView!
    @IBOutlet var stars3: UIImageView!
    //MARK: - core motion on the stars
    private var animator: UIDynamicAnimator!
    private var gravity: UIGravityBehavior!
    private var pushBehavior: UIPushBehavior!
    // MARK: - Constants
    private let motionManager = CMMotionManager()
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        let attachements = stars.map { (star: UIImageView) ->  UIAttachmentBehavior in
            let anchor = star.center
            let behavior = UIAttachmentBehavior(item: star, attachedToAnchor: anchor)
            behavior.length = 150
            behavior.frictionTorque = 10
            return behavior
        }
        animator = UIDynamicAnimator(referenceView: view)
        attachements.forEach { self.animator.addBehavior($0) }
        gravity = UIGravityBehavior(items: stars)
        animator.addBehavior(gravity)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGesture)
        
        clouds.addMotionDisplacement(xAxisAmount: 100, yAxisAmount: 100)
        stars1.addMotionDisplacement(xAxisAmount: 25, yAxisAmount: 25)
        stars2.addMotionDisplacement(xAxisAmount: 25, yAxisAmount: 25)
        stars3.addMotionDisplacement(xAxisAmount: 25, yAxisAmount: 25)
    }
    
    @objc private func tap(sender: UITapGestureRecognizer) {
        stars.forEach { star in
            let location = sender.location(in: star)
            if star.bounds.contains(location) {
                let direction = CGVector(dx: star.center.x - location.x, dy: star.center.y - location.y)
                if let pushBehavior = self.pushBehavior {
                    self.animator.removeBehavior(pushBehavior)
                }
                self.pushBehavior = UIPushBehavior(items: [star], mode: .instantaneous)
                self.pushBehavior.pushDirection = direction
                self.pushBehavior.magnitude = 0.2
                self.animator.addBehavior(self.pushBehavior)
            }
        }
    }
    
    // MARK: - josh rock and animation
    
    @IBOutlet weak var Josh: UIButton!
    var joshSound = AVPlayer(name: "Boing", extension: "wav")!
    
    @IBAction func tapJosh(_ sender: UIButton) {
        
        joshSound.playFromStart()
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
            self.Josh.transform = CGAffineTransform(rotationAngle: 5)
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
                self.Josh.transform = CGAffineTransform(rotationAngle: -5)
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
                    self.Josh.transform = CGAffineTransform.identity
                }, completion: nil)
               
                
            })
        })
    }


}

