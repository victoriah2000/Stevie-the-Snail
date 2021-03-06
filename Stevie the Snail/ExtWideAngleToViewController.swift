//
//  ExtWideAngleToViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit
import AVFoundation

class ExtWideAngleToViewController: UIViewController {
    
    
    @IBOutlet weak var Josh: UIImageView!
    var joshSound = AVPlayer(name: "Boing", extension: "wav")!
    var daisySound = AVPlayer(name: "twinkle", extension: "mp3")!
    var beeSummer = AVPlayer(name: "beesummer", extension: "mp3")!
    var catMeow = AVPlayer(name: "meow2", extension: "mp3")!
    
    @IBAction func tapJosh(_ sender: Any) {
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
    
    @IBOutlet var frontGrass: UIImageView!
    
    @IBOutlet var beeFly: BeeAnimationView!
    
  
    var sunSound = AVPlayer(name: "sunflourish", extension: "mp3")!
    var hopSound = AVPlayer(name:  "hop", extension: "mp3")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fly()
        frontGrass.addMotionDisplacement (xAxisAmount: 100, yAxisAmount: 0)
        beeSummer.playLoop()
    }
    
    func fly() {
        beeFly.addFlyAnimation() { _ in
            self.fly()
        }
    }


    @IBAction func daisyFace(_ sender: UIButton) {
        daisySound.playFromStart()
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = 2 * CGFloat.pi
        animation.isCumulative = true
        animation.duration = 0.5
        sender.layer.add(animation, forKey: "spin")
    }
    
    @IBAction func Cat(_ sender: UIButton) {
        catMeow.playFromStart()
    }
    
    @IBOutlet var grasshopperJump: UIImageView!
    @IBAction func sunButton(_ sender: UIButton){
        sunSound.playFromStart()
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = 2 * CGFloat.pi
        animation.isCumulative = true
        animation.duration = 0.5
        sender.layer.add(animation, forKey: "spin")
    }
    
    
    @IBAction func tapGrasshopper(_ sender: Any) {
        hopSound.playFromStart()
        
        UIView.animate(withDuration: 0.125, delay: 0, options: [.curveEaseOut], animations: {
            self.grasshopperJump.transform = CGAffineTransform(translationX: 0, y: -3*self.grasshopperJump.bounds.size.height)
        }, completion: { _ in
            UIView.animate(withDuration: 0.125, delay: 0, options: [.curveEaseIn], animations: {
                self.grasshopperJump.transform = .identity
            }, completion: { _ in
                
            })
        })
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        beeSummer.endLoop()
    }


}
