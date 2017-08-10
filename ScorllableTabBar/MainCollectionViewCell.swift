//
//  MainCollectionViewCell.swift
//  ScorllableTabBar
//
//  Created by Kulkarni on 27/07/17.
//  Copyright © 2017 Shrilakshmi Kulkarni. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func cellIdentifier() -> String {
        return "MainCollectionViewCell"
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MainCollectionViewCell", bundle: nil)
    }
}
