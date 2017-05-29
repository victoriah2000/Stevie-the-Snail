//
//  FinaleViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

class FinaleViewController: UIViewController {
    
    @IBAction func sunButton(_ sender: Any) {
    }

    @IBAction func tapSun(_ sender: UIButton) {
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
    }
  

}
