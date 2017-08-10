//
//  MainCollectionViewController.swift
//  ScorllableTabBar
//
//  Created by Kulkarni on 27/07/17.
//  Copyright © 2017 Shrilakshmi Kulkarni. All rights reserved.
//

import UIKit

class MainCollectionViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    weak var tabBarDelegate: TabViewControllerDelegate?
    
    var labelArrays = ["Test1","Test2","Test3","Test 4","Test 5","Test 6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func setUpCollectionView() {
        self.mainCollectionView.delegate = self
        self.mainCollectionView.dataSource = self
        self.mainCollectionView.isPagingEnabled = true
        
        self.mainCollectionView.register(MainCollectionViewCell.nib(), forCellWithReuseIdentifier: MainCollectionViewCell.cellIdentifier())
        
        if let flowLayout = self.mainCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 0
        }
        self.mainCollectionView.reloadData()
    }
    
    func selectItemAt(index : Int) {
        let indexPath = IndexPath(item: index, section: 0)
        //self.mainCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        collectionView(self.mainCollectionView, didSelectItemAt: indexPath)
        
    }
    
    func checkIfCellIsVisible() {
        let visibleIndexPaths = self.mainCollectionView.indexPathsForVisibleItems
        for indexPath in visibleIndexPaths {
            print(indexPath.row)
            tabBarDelegate?.tabViewController(didMoveCellTo: indexPath.row)
        }
    }
    
    func getRandomColor() -> UIColor {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
}


extension MainCollectionViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.cellIdentifier(), for: indexPath) as! MainCollectionViewCell
        //self.configureCell(cell: cell, indexPath: indexPath)
        cell.backgroundColor = getRandomColor()
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labelArrays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)!
//        print(cell.frame.origin.y)
//        print(cell.frame.height)
    }
}


extension MainCollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}


extension MainCollectionViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //checkIfCellIsVisible()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        checkIfCellIsVisible()
    }
}







