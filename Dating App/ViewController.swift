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
    
   let myCoverImage = [String](repeating: "Bitmap", count: 5)
   let intrestArr = ["Women","Men","From 22 to 44"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        interstCollectionView.delegate = self
        interstCollectionView.dataSource = self
        interstCollectionView.register(IntrestCell.nib, forCellWithReuseIdentifier: IntrestCell.identifier)
        activePrecent.layer.masksToBounds = true

        activePrecent.layer.cornerRadius = 15

        let scrollViewWidth:CGFloat = self.ScrollView.frame.width
        let scrollViewHeight:CGFloat = self.ScrollView.frame.height
        let screenImageHeight:CGFloat = UIScreen.main.bounds.height - self.ScrollView.frame.height
        let finalScreenHeight:CGFloat = scrollViewHeight + (screenImageHeight/2)
        
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:finalScreenHeight))
             imgOne.image = UIImage(named: "Bitmap")
        imgOne.contentMode = .scaleAspectFill
             let imgTwo = UIImageView(frame: CGRect(x:UIScreen.main.bounds.width, y:0,width:scrollViewWidth, height:finalScreenHeight))
             imgTwo.image = UIImage(named: "Bitmap")
        let imgThree = UIImageView(frame: CGRect(x:UIScreen.main.bounds.width*2, y:0,width:scrollViewWidth, height:finalScreenHeight))
             imgThree.image = UIImage(named: "Bitmap")
             let imgFour = UIImageView(frame: CGRect(x:UIScreen.main.bounds.width*3, y:0,width:scrollViewWidth, height:finalScreenHeight))
             imgFour.image = UIImage(named: "Bitmap")
        let imgFive = UIImageView(frame: CGRect(x:UIScreen.main.bounds.width*4, y:0,width:scrollViewWidth, height:finalScreenHeight))
                   imgFive.image = UIImage(named: "Bitmap")
        
        
        self.ScrollView.addSubview(imgOne)
             self.ScrollView.addSubview(imgTwo)
             self.ScrollView.addSubview(imgThree)
             self.ScrollView.addSubview(imgFour)
        self.ScrollView.addSubview(imgFive)

    
        //4
        self.ScrollView.contentSize = CGSize(width:self.ScrollView.frame.width * 5, height:0)
        
        
        self.ScrollView.delegate = self
        self.PageControl.currentPage = 0
        

        self.interestsView.layer.cornerRadius = 8
        self.aboutView.layer.cornerRadius = 8
        self.nameActiveView.layer.cornerRadius = 8

        setGradientBackground()
        self.view.bringSubviewToFront(gradiantView)
        
        
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 55.0/255.0, green: 44.0/255.0, blue: 77.0/255.0, alpha: 0.5).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 0.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: self.view.frame.origin.x, y:  self.view.frame.origin.y, width:  self.view.frame.size.width, height: self.gradiantView.frame.size.height)

        self.gradiantView.layer.insertSublayer(gradientLayer, at:0)
    }


    
    

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
    // Test the offset and calculate the current page after scrolling ends
    let pageWidth:CGFloat = scrollView.frame.width
    let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
    // Change the indicator
    self.PageControl.currentPage = Int(currentPage);
    // Change the text accordingly
 
     
    }
    
    func setBackgroundButton(button:UILabel,text:String)  {

          let cornerRadius : CGFloat = 5.0

          button.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
          button.textColor = UIColor.white
          button.backgroundColor = .clear
          button.layer.borderWidth = 1.0
          button.layer.borderColor = UIColor.white.cgColor
          button.layer.cornerRadius = cornerRadius
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
        return intrestArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = interstCollectionView.dequeueReusableCell(withReuseIdentifier: IntrestCell.identifier, for: indexPath) as! IntrestCell
        
        cell.intrestLabel.text = intrestArr[indexPath.row]
        
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

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
