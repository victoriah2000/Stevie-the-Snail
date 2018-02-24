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
    
    //MARK: Insect Animation
    @IBAction func tapladyBug(_ sender: UIButton) {
        
        //UIView.animate(withDuration: 0.1, animations: self.ladyBug.transform = CGAffineTransform(rotation))
    }
    @IBOutlet var insectFly: InsectFlyView!
    
    var beeSound = AVPlayer(name: "buzzingbees", extension:"mp3")!
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        beeSound.playLoop()
        mosquitobuzz()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        beeSound.endLoop()
    }
    
    func mosquitobuzz() {
        insectFly.addMosquitoBuzzAnimation() { _ in
            self.mosquitobuzz()
        }
    
}

}
