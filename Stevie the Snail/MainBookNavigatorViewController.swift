//
//  MainBookNavigatorViewController.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 3/1/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit
import AVFoundation

class MainBookNavigatorViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!

    @IBOutlet weak var forwardButton: UIButton!
    let pages: [String] = [
        String(describing: TitleViewController.self),
        String(describing: AppleShotViewController.self),
        String(describing: ExtTreeWideShotViewController.self),
        String(describing: ExtWideAngleToViewController.self),
        String(describing: GardenCloseUpViewController.self),
        String(describing: HeartbeatViewController.self),
        String(describing: CloseUpTreeToSunViewController.self),
        String(describing: ShellLiftToPathViewController.self),
        String(describing: SnailCrawlViewController.self),
        String(describing: NightViewController.self),
        String(describing: SunInSkyViewController.self),
        String(describing: OnTheMoveViewController.self),
        String(describing: GardenArrivalViewController.self),
        String(describing: GardnCloseUp2ViewController.self),
        String(describing: FinaleViewController.self),
        String(describing: TheEndViewController.self),
        String(describing: TitlesAndCreditsViewController.self),
        ]

    var currentIndex = 0
    var currentViewController: UIViewController!
    var nightviewSound = AVPlayer(name:  "night_owl", extension: "mp3")!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentViewController = UIStoryboard(name: pages[0], bundle: nil).instantiateInitialViewController()!
        view.insertSubview(currentViewController.view, at: 0)
        currentViewController.willMove(toParentViewController: self)
        addChildViewController(currentViewController)
        currentViewController.view.constrainToSuperView()
    }


    @IBAction func navigate(_ sender: UIButton) {
        let nextIndex = currentIndex + (sender === backButton ? -1 : 1)
        guard nextIndex >= 0 && nextIndex < pages.count else {
            return
        }
        transition(to: pages[nextIndex])
        currentIndex = nextIndex
    }

    func transition(to identifier: String) {
        if identifier == String(describing: NightViewController.self) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.nightviewSound.playLoop()
            }
        } else {
            nightviewSound.endLoop()
        }
        let newViewcontroller = UIStoryboard(name: identifier, bundle: nil).instantiateInitialViewController()!
        newViewcontroller.view.frame = currentViewController.view.frame
        currentViewController.willMove(toParentViewController: nil)
        UIView.transition(from: currentViewController.view, to: newViewcontroller.view, duration: 0.25, options: [.transitionCrossDissolve], completion: { _ in
            self.currentViewController = newViewcontroller
            self.currentViewController.view.constrainToSuperView()
            self.view.sendSubview(toBack: self.currentViewController.view)
            self.backButton.isHidden = self.currentIndex == 0
            self.forwardButton.isHidden = self.currentIndex == self.pages.count - 1
        })
    }
    
}

