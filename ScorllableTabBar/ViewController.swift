//
//  ViewController.swift
//  tabBar
//
//  Created by Kulkarni on 22/07/17.
//  Copyright © 2017 Shrilakshmi Kulkarni. All rights reserved.
//

import UIKit

//TabbarController -> ViewController -> PageViewController (child) -> BaseChildViewControllers(n) -> SpecificChildviewControllers -> Custom UI

class ViewController: UIViewController {
    
    var sideScrollViewController : SideScrollViewController!
    var mainPageViewController : MainPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainPageViewControllerSegue" {
            let mainPageViewController = segue.destination as! MainPageViewController
            mainPageViewController.informingDelegate = self
            self.mainPageViewController = mainPageViewController
            
            
        }
        if segue.identifier == "sideScrollViewControllerSegue" {
            let sideScrollViewController = segue.destination as! SideScrollViewController
            self.sideScrollViewController = sideScrollViewController
            self.sideScrollViewController.delegate = self
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : MainPageViewControllerDelegate {
    func mainPageViewController(mainPageViewController: MainPageViewController, didMovePageTo location: Int) {
        self.sideScrollViewController.selectItemAt(index: location)
    }
}

extension ViewController : SideScrollViewControllerDelegate {
    func sideScrollViewController(sideScrollViewController: SideScrollViewController, didMoveTo location: Int) {
        self.mainPageViewController.moveTo(page: location)
    }
}



