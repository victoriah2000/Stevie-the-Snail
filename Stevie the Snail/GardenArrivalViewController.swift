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
    
    @IBOutlet weak var stevieImageView: UIImageView!
    private var slugCrawl = AVPlayer(name: "slugcrawl", extension: "mp3")!
    private var stevieAnimator: UIViewPropertyAnimator!
    private let stevieInitialX: CGFloat = 170
    private lazy var stevieDistance: CGFloat = {
        return view.bounds.width
    }()
    private let stevieAnimationTime: TimeInterval = 40
    //MARK: Sounds
    var daisySound = AVPlayer(name:  "twinkle", extension: "mp3")!
    
    @IBAction func daisySpin(_ sender: UIView) {
        daisySound.playFromStart()
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = 2 * CGFloat.pi
        animation.isCumulative = true
        animation.duration = 0.5
        sender.layer.add(animation, forKey: "spin")
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        slugCrawl.playLoop()
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
}
