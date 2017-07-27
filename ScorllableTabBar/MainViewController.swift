//
//  MainViewController.swift
//  tabBar
//
//  Created by Kulkarni on 22/07/17.
//  Copyright © 2017 Shrilakshmi Kulkarni. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    
    
    weak var informingDelegate : MainPageViewControllerDelegate?

    var pages = [BasePageChildViewController]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let page6 = storyboard.instantiateViewController(withIdentifier: "helloWorld") as! HelloWorldViewController
    
        
        self.delegate = self
        self.dataSource = self
        
        let page1: BasePageChildViewController! = SpecificBaseViewController()
        let page2: BasePageChildViewController! = BasePageChildViewController()
        let page3: BasePageChildViewController! = BasePageChildViewController()
        let page4: BasePageChildViewController! = BasePageChildViewController()
        let page5: BasePageChildViewController! = SpecificBaseViewController()
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        pages.append(page5)
        pages.append(page6)
        
        setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
    }
    
    func moveTo(page : Int) {
        //Forward, backward and stuff. Test if it is right.
        let relevantPage = self.pages[page]
        setViewControllers([relevantPage], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let viewController = pageViewController.viewControllers![0] as! BasePageChildViewController
        self.informingDelegate?.mainPageViewController(mainPageViewController: self, didMovePageTo: self.pages.index(of: viewController) ?? 0)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.index(of: viewController as! BasePageChildViewController)!
        let nextIndex = currentIndex + 1
        if nextIndex >= pages.count {
            return nil
        }
        return pages[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        let currentIndex = pages.index(of: viewController as! BasePageChildViewController)!
        let previousIndex = currentIndex - 1
        if previousIndex < 0 {
            return nil
        }
        return pages[previousIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

protocol MainPageViewControllerDelegate:class {
    func mainPageViewController(mainPageViewController : MainPageViewController, didMovePageTo location : Int)
}
