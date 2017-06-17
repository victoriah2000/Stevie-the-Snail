//
//  OnTheMoveViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

class OnTheMoveViewController: UIViewController {

    @IBOutlet var insectFly: InsectFlyView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        mosquitobuzz()
    }
    
    func mosquitobuzz() {
        insectFly.addMosquitoBuzzAnimation() { _ in
            self.mosquitobuzz()
        }
    
}

}
