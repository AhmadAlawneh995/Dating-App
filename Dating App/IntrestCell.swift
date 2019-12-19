//
//  IntrestCell.swift
//  Dating App
//
//  Created by Ahmad Alawneh on 12/19/19.
//  Copyright © 2019 Ahmad Alawneh. All rights reserved.
//

import Foundation
import UIKit

class IntrestCell: UICollectionViewCell {
    @IBOutlet weak var intrestLabel: UILabel!
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

