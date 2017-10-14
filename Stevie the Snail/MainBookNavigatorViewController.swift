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
        //String(describing: TitlesAndCreditsViewController.self),
        ]

    var currentIndex = 0
    var currentViewController: UIViewController!
    var currentPlayer = AVPlayer()
    var nightviewSound = AVPlayer(name:  "night_owl", extension: "mp3")!
    var chap1Music = AVPlayer(name:  "chapter2", extension: "mp3")!
    var chap2Music = AVPlayer(name:  "chapter1", extension: "mp3")!
    var musicSate = MusicState.intro
    enum MusicState {
        case intro, main, night
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let widthScale = UIScreen.main.bounds.size.width / 1024
        view.transform = CGAffineTransform(scaleX: widthScale, y: widthScale)
        currentViewController = UIStoryboard(name: pages[0], bundle: nil).instantiateInitialViewController()!
        view.insertSubview(currentViewController.view, at: 0)
        currentViewController.willMove(toParentViewController: self)
        addChildViewController(currentViewController)
        currentViewController.view.constrainToSuperView()
        chap1Music.playLoop()
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
        let newMusicSate: MusicState
        switch identifier {
        case String(describing: TitleViewController.self):
            newMusicSate = .intro
        case String(describing: NightViewController.self):
            newMusicSate = .night
        case String(describing: SunInSkyViewController.self):
            newMusicSate = .intro
        default:
            newMusicSate = .main
        }
        if newMusicSate != musicSate {
            musicSate = newMusicSate
            switch musicSate {
            case .intro:
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self.chap1Music.playLoop()
                    self.chap2Music.pause()
                    self.nightviewSound.pause()
                }
            case .main:
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self.chap1Music.pause()
                    self.chap2Music.playLoop()
                    self.nightviewSound.pause()
                }
            case .night:
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self.chap1Music.pause()
                    self.chap2Music.pause()
                    self.nightviewSound.playLoop()
                }
            }
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

