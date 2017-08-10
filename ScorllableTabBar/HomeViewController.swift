//
//  HomeViewController.swift
//  ScorllableTabBar
//
//  Created by Kulkarni on 27/07/17.
//  Copyright © 2017 Shrilakshmi Kulkarni. All rights reserved.
//

import UIKit

protocol MainCollectionViewDelegate: class {
    func mainPageViewController(didMoveCellTo index : Int)
}

protocol TabViewControllerDelegate : class {
    func tabViewController(didMoveCellTo index : Int)
}

class HomeViewController: UIViewController {

    @IBOutlet weak var navBar: UIView!
    
    var tabBarViewController : TabBarViewController!
    var mainCollectionViewController : MainCollectionViewController!
    
    var highlightView = UIView()
    var labelArrays = ["Test1","Test2","Test3","Test 4","Test 5","Test 6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mainCollectionViewControllerSegue" {
            let mainCollectionViewController = segue.destination as! MainCollectionViewController
            mainCollectionViewController.tabBarDelegate = self
            self.mainCollectionViewController = mainCollectionViewController
        }
        
        if segue.identifier == "tabViewControllerSegue" {
            let tabBarViewController = segue.destination as! TabBarViewController
            self.tabBarViewController = tabBarViewController
            self.tabBarViewController.mainCollectionViewDelegate = self
        }
    }
}


extension HomeViewController : MainCollectionViewDelegate, TabViewControllerDelegate {
    
    func mainPageViewController(didMoveCellTo index : Int) {
        self.mainCollectionViewController.selectItemAt(index: index)
    }
    
    func tabViewController(didMoveCellTo index : Int) {
        self.tabBarViewController.selectItemAt(index: index)
    }
}











