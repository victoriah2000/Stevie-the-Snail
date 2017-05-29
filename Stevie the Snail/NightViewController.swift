//
//  NightViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

class NightViewController: UIViewController {

    @IBOutlet var clouds: UIImageView!
    override func viewDidLoad() {
     super.viewDidLoad()
        clouds.addMotionDisplacement(xAxisAmount: 100, yAxisAmount: 100)
    }
}
