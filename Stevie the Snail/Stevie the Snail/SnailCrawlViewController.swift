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

   @IBOutlet var whizzBy: WhizzView!
    var beeSound = AVPlayer(name:  "buzzingbees", extension:"mp3")!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        beeSound.playLoop()
        Fly()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        beeSound.endLoop()
    }
    
    func Fly(){
    whizzBy.addFlyAnimation() { _ in
        self.Fly()
}

}
}
