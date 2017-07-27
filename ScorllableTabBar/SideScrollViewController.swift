//
//  SideScrollViewController.swift
//  tabBar
//
//  Created by Kulkarni on 22/07/17.
//  Copyright © 2017 Shrilakshmi Kulkarni. All rights reserved.
//

import UIKit

class SideScrollViewController: UIViewController {
    
    var highlightView = UIView()
    weak var delegate : SideScrollViewControllerDelegate?
    
    var labelArrays = ["Test1","Test2","Test3","Test 4","Test 5","Test 6"]
    var manualSelection = true
    @IBOutlet weak var collectionView : UICollectionView!
    
    func setLabelArrays(labelArray : [String] ) {
        self.labelArrays = labelArray
        self.collectionView.reloadData()
    }

    func selectItemAt(index : Int) {
        let indexPath = IndexPath(item: index, section: 0)
        self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        self.manualSelection = false
        collectionView(self.collectionView, didSelectItemAt: indexPath)
        self.manualSelection = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        self.setupHighLightView(frame: CGRect(x: 0, y: 30, width: 112, height: 2))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHighLightView(frame:CGRect) {
        highlightView.frame = frame
        highlightView.backgroundColor = UIColor.red
        self.collectionView.addSubview(highlightView)
    }
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(LabelCollectionViewCell.nib(), forCellWithReuseIdentifier: LabelCollectionViewCell.cellIdentifier())
        self.collectionView.isPagingEnabled = true
        self.collectionView.reloadData()
        self.collectionView.allowsSelection = true
    }
}

extension SideScrollViewController : UICollectionViewDelegate,UICollectionViewDataSource {
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
        if manualSelection == true {
            self.delegate?.sideScrollViewController(sideScrollViewController: self, didMoveTo: indexPath.row)
        }
    }
    
    func configureCell(cell : LabelCollectionViewCell,indexPath : IndexPath) {
        let label = self.labelArrays[indexPath.row]
        cell.labelName.text = label
    }
}

protocol SideScrollViewControllerDelegate : class{
    func sideScrollViewController(sideScrollViewController : SideScrollViewController, didMoveTo location : Int)
}
