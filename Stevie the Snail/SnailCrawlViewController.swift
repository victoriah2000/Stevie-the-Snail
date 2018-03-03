//
//  SnailCrawlViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit
import AVFoundation

class SnailCrawlViewController:  UIViewController  {

    @IBOutlet weak var stevieImageView: UIImageView!
    @IBOutlet var whizzBy: WhizzView!
    private var beeSound = AVPlayer(name:  "buzzingbees", extension:"mp3")!
    private var stevieAnimator: UIViewPropertyAnimator!
    private let stevieInitialX: CGFloat = 170
    private lazy var stevieDistance: CGFloat = {
        return self.view.bounds.width - self.stevieImageView.bounds.width / 2 - stevieImageView.center.x
    }()
    private let stevieAnimationTime: TimeInterval = 15


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        beeSound.playLoop()
        Fly()
        stevieAnimator = UIViewPropertyAnimator(duration: stevieAnimationTime, curve: .easeInOut) {
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
    }

    @IBAction func pan(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
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

    func Fly(){
    whizzBy.addFlyAnimation() { _ in
        self.Fly()
}

}
}
