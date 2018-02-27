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
    //mark strings for variables
    private var strings: [UIView] = []
    //MARK: - core motion on the stars
    private var animator: UIDynamicAnimator!
    private var gravity: UIGravityBehavior!
    private var pushBehavior: UIPushBehavior!
    // MARK: - Constants
    private let motionManager = CMMotionManager()
    let stringLengths: [CGFloat] = [75, 100, 150, 120, 80]
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
        strings = zip(stars, stringLengths).map { (star,stringLength) -> UIView in
            let string = UIView()
            string.translatesAutoresizingMaskIntoConstraints = false
            self.view.insertSubview(string, at: 0)
            string.backgroundColor = .lightGray
            string.widthAnchor.constraint(equalToConstant: 3).isActive = true
            string.heightAnchor.constraint(equalToConstant: stringLength).isActive = true
            string.centerXAnchor.constraint(equalTo: star.centerXAnchor).isActive = true
            string.bottomAnchor.constraint(equalTo: star.centerYAnchor).isActive = true
            return string
        }
        animator = UIDynamicAnimator(referenceView: view)
        view.layoutIfNeeded()
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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var attachments: [UIDynamicBehavior] = [UIAttachmentBehavior(item: view, attachedToAnchor: view.center)]
        zip(stars, strings).forEach { (star, string) in
            let anchor = CGPoint(x: string.center.x, y: string.frame.origin.y)
            let stringAttachment = UIAttachmentBehavior(item: string, offsetFromCenter: UIOffset(horizontal: 0, vertical: -string.frame.size.height / 2 - star.frame.size.height / 2), attachedToAnchor: anchor)
            let starAttachment =  UIAttachmentBehavior.pinAttachment(with: star, attachedTo: string, attachmentAnchor: star.center)
            starAttachment.frictionTorque = 100
            attachments.append(stringAttachment)
            attachments.append(starAttachment)
        }
        animator.removeAllBehaviors()
        attachments.forEach { self.animator.addBehavior($0) }
        gravity = UIGravityBehavior(items: [stars,strings].flatMap{$0})
        animator.addBehavior(gravity)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGesture)
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

