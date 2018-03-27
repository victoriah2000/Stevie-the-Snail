//
//  OnTheMoveViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit
import AVFoundation

class OnTheMoveViewController: UIViewController {
    //MARK: ladyBug
    @IBOutlet weak var ladyBug: UIButton!
    
    @IBOutlet weak var stevieImageView: UIImageView!
    private var beeSound = AVPlayer(name: "buzzingbees", extension:"mp3")!
    private var slugCrawl = AVPlayer(name: "slugcrawl", extension: "mp3")!
    private var stevieAnimator: UIViewPropertyAnimator!
    private let stevieInitialX: CGFloat = 170
    private lazy var stevieDistance: CGFloat = {
        return view.bounds.width
    }()
    private let stevieAnimationTime: TimeInterval = 40
    //MARK: Insect Animation
    @IBAction func tapladyBug(_ sender: UIButton) {
        
        //UIView.animate(withDuration: 0.1, animations: self.ladyBug.transform = CGAffineTransform(rotation))
    }
    @IBOutlet var insectFly: InsectFlyView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        beeSound.playLoop()
        slugCrawl.playLoop()
        mosquitobuzz()
        stevieAnimator = UIViewPropertyAnimator(duration: stevieAnimationTime, curve: .easeIn) {
            self.stevieImageView.center.x = self.stevieInitialX + self.stevieDistance
        }
        stevieAnimator.isUserInteractionEnabled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            //Need to clear the page turning animation
            self.stevieAnimator.startAnimation()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        beeSound.endLoop()
        slugCrawl.endLoop()
    }
    
    
    @IBAction func pan(_ recognizer: UIPanGestureRecognizer) {switch recognizer.state {
    case .began, .changed:
        stevieAnimator.stopAnimation(true)
        let delta = recognizer.translation(in: stevieImageView)
        stevieImageView.center.x += delta.x
        stevieImageView.center.x  = min (stevieDistance + stevieInitialX, stevieImageView.center.x)
        recognizer.setTranslation(.zero, in: stevieImageView)
    case .ended, .cancelled:
        let time = stevieAnimationTime * TimeInterval(1 - (stevieImageView.center.x - stevieInitialX) / stevieDistance)
        stevieAnimator = UIViewPropertyAnimator(duration:  time , curve: .easeInOut) {
            self.stevieImageView.center.x = self.stevieInitialX + self.stevieDistance
        }
        stevieAnimator.startAnimation()
    default:
        break
        }
    }
    
    func mosquitobuzz() {
        insectFly.addMosquitoBuzzAnimation() { _ in
            self.mosquitobuzz()
}
    
}

}
