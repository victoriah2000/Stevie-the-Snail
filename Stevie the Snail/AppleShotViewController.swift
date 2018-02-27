//
//  AppleShotViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 2/2/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

class AppleShotViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var appleBackground: UIImageView!
    @IBOutlet var stevie: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.addMotionDisplacement(xAxisAmount: 0, yAxisAmount: 0)
    appleBackground.addMotionDisplacement(xAxisAmount: 75, yAxisAmount: 75)
        stevie.addMotionDisplacement(xAxisAmount: 10, yAxisAmount: 10)

}
}
