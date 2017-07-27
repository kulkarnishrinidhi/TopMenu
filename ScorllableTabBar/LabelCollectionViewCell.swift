//
//  LabelCollectionViewCell.swift
//  tabBar
//
//  Created by Kulkarni on 22/07/17.
//  Copyright © 2017 Shrilakshmi Kulkarni. All rights reserved.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelName : UILabel!
    
    static func cellIdentifier() -> String {
        return "labelCollectionViewCell"
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "LabelCollectionViewCell", bundle: nil)
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
