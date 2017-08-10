//
//  TabBarViewController.swift
//  ScorllableTabBar
//
//  Created by Kulkarni on 27/07/17.
//  Copyright © 2017 Shrilakshmi Kulkarni. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var tabCollectionView: UICollectionView!
    weak var mainCollectionViewDelegate: MainCollectionViewDelegate?
    
    var highlightView = UIView()
    var labelArrays = ["Test1","Test2","Test3","Test 4","Test 5","Test 6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        self.setupHighLightView(frame: CGRect(x: 0, y: 32, width: 50, height: 2))
        self.tabCollectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension TabBarViewController {
    
    func selectItemAt(index : Int) {
        let indexPath = IndexPath(item: index, section: 0)
       // self.tabCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        collectionView(self.tabCollectionView, didSelectItemAt: indexPath)
        
    }
    
    func setupHighLightView(frame:CGRect) {
        highlightView.frame = frame
        highlightView.backgroundColor = UIColor.red
        self.tabCollectionView.addSubview(highlightView)
    }
    
    func setupCollectionView() {
        self.tabCollectionView.delegate = self
        self.tabCollectionView.dataSource = self
        self.tabCollectionView.register(LabelCollectionViewCell.nib(), forCellWithReuseIdentifier: LabelCollectionViewCell.cellIdentifier())
        self.tabCollectionView.isPagingEnabled = true
        self.tabCollectionView.allowsSelection = true
    }
    
}


extension TabBarViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.cellIdentifier(), for: indexPath) as! LabelCollectionViewCell
        self.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labelArrays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)!
        print(cell.frame.origin.y)
        print(cell.frame.height)
        UIView.animate(withDuration: 0.3) {
            self.highlightView.frame.origin.x = cell.frame.origin.x
        }
        mainCollectionViewDelegate?.mainPageViewController(didMoveCellTo: indexPath.row)
    }
    
    func configureCell(cell : LabelCollectionViewCell,indexPath : IndexPath) {
        let label = self.labelArrays[indexPath.row]
        cell.labelName.text = label
    }
}
