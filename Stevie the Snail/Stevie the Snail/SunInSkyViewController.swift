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
    @IBOutlet weak var web: UIView! = UIView()
    //var web = UIView()
    
    @IBOutlet weak var Josh: UIButton!
     var joshSound = AVPlayer(name: "Boing", extension: "wav")!
     var sunSound = AVPlayer(name: "sunflourish", extension: "mp3")!
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 4, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 1, options: .curveLinear, animations: {
            self.spider.transform = CGAffineTransform(translationX: 0, y: 200)
            self.web.frame.size.height += 200
        }, completion: nil)
        
    }

}
