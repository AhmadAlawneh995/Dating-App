//
//  ViewController.swift
//  Dating App
//
//  Created by Ahmad Alawneh on 12/18/19.
//  Copyright © 2019 Ahmad Alawneh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var nameActiveView: UIView!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var interestsView: UIView!
    @IBOutlet weak var activePrecent: UILabel!
    @IBOutlet weak var gradiantView: UIView!
    @IBOutlet weak var interstCollectionView: UICollectionView!
    
    
   lazy var responseData:UserInformation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        responseData = setUpData()

    
        interstCollectionView.delegate = self
        interstCollectionView.dataSource = self
        interstCollectionView.register(IntrestCell.nib, forCellWithReuseIdentifier: IntrestCell.identifier)
        activePrecent.layer.masksToBounds = true
        activePrecent.layer.cornerRadius = 10

     
        
    }



    

    override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
     }
}



extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
 
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return responseData?.interest?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = interstCollectionView.dequeueReusableCell(withReuseIdentifier: IntrestCell.identifier, for: indexPath) as! IntrestCell
        
        cell.intrestLabel.text = responseData?.interest?[indexPath.row].interestTitle
        
        let cornerRadius : CGFloat = 5.0

        let color:UIColor = .random
        cell.intrestLabel.textColor = color
           cell.backgroundColor = .clear
           cell.layer.borderWidth = 1.0
     
        cell.intrestLabel.textAlignment = .center
        cell.layer.borderColor = color.cgColor
           cell.layer.cornerRadius = cornerRadius
        
        return cell
    }
}

