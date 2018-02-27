//
//  SunInSkyViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit
import AVFoundation

class SunInSkyViewController: UIViewController {
    @IBOutlet var spider: UIView! = UIView()

    @IBOutlet weak var web: UIView!

    @IBOutlet weak var Josh: UIButton!
     var joshSound = AVPlayer(name: "Boing", extension: "wav")!
     var sunSound = AVPlayer(name: "sunflourish", extension: "mp3")!
    var animator: UIViewPropertyAnimator!
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
    
    @IBAction func tapSun(_ sender: UIButton) {
        sunSound.playFromStart()
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = 2 * CGFloat.pi
        animation.isCumulative = true
        animation.duration = 0.5
        sender.layer.add(animation, forKey: "spin")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        spider.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapSpider))
        spider.addGestureRecognizer(tap)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.layoutIfNeeded()
        animateSpiderDrop()
    }
    
    private func animateSpiderDrop() {
        animator = UIViewPropertyAnimator(duration: 5, dampingRatio: 0.3) {
            self.spider.transform = CGAffineTransform(translationX: 0, y: 200)
            self.web.transform = CGAffineTransform(translationX: 0, y: 100).scaledBy(x: 1, y: 2)
        }
        animator.isUserInteractionEnabled = true
        animator.startAnimation()
    }

    @objc private func tapSpider(_ recognizer: UITapGestureRecognizer) {
        guard animator != nil else {
            return
        }
        animator.stopAnimation(true)
        animator.finishAnimation(at: .current)
        animator = UIViewPropertyAnimator(duration: 1, curve: .easeOut) {
            self.spider.transform = .identity
            self.web.transform = .identity
        }
        animator.addCompletion { _ in
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                self.animateSpiderDrop()
            }
        }
        animator.isUserInteractionEnabled = false
        animator.startAnimation()
    }

}
