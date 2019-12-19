//
//  Helper.swift
//  Dating App
//
//  Created by Ahmad Alawneh on 12/19/19.
//  Copyright © 2019 Ahmad Alawneh. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Genarate Random Color
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}


extension ViewController{


    // MARK: - GET  Data From JSON File
    func setUpData() -> UserInformation {
        var response:UserInformation? = nil

        if let path = Bundle.main.path(forResource: "Information", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(UserInformation.self, from: data)
                response = responseObject
                setUpScrollView(responseData: response!)
                
              } catch {
                   // handle error
              }
        }
        return response!
    }
    
    // MARK: - Set Gradient View
    func setGradientBackground() {
        let colorTop =  UIColor(red: 55.0/255.0, green: 44.0/255.0, blue: 77.0/255.0, alpha: 0.5).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 0.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: self.view.frame.origin.x, y:  self.view.frame.origin.y, width:  self.view.frame.size.width, height: self.gradiantView.frame.size.height)

        self.gradiantView.layer.insertSublayer(gradientLayer, at:0)
    }
    

    // MARK: - Set Image Slider
    func setUpScrollView(responseData:UserInformation) {
        let scrollViewWidth:CGFloat = self.ScrollView.frame.width
             let scrollViewHeight:CGFloat = self.ScrollView.frame.height
             let screenImageHeight:CGFloat = UIScreen.main.bounds.height - self.ScrollView.frame.height
             let finalScreenHeight:CGFloat = scrollViewHeight + (screenImageHeight/2)
             
        
        var imageCount = 0
        
        while imageCount < responseData.images?.count ?? 0 {
            var img:UIImageView?
            if imageCount > 0  {
                let doubleScreen = CGFloat(imageCount)

                img = UIImageView(frame: CGRect(x:UIScreen.main.bounds.width * doubleScreen, y:0,width:scrollViewWidth, height:finalScreenHeight))
                img?.image = UIImage(named: responseData.images?[imageCount].imageName ?? "")
            }else{
            img = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:finalScreenHeight))
                img?.image = UIImage(named: responseData.images?[imageCount].imageName ?? "")
                img?.contentMode = .scaleAspectFill
            }
            imageCount = imageCount + 1
            self.ScrollView.addSubview(img!)

            }

         
             self.ScrollView.contentSize = CGSize(width:self.ScrollView.frame.width * 5, height:0)
             
             
             self.ScrollView.delegate = self
             self.PageControl.currentPage = 0
             

             self.interestsView.layer.cornerRadius = 8
             self.aboutView.layer.cornerRadius = 8
             self.nameActiveView.layer.cornerRadius = 8

             setGradientBackground()
             self.view.bringSubviewToFront(gradiantView)
    }

    // MARK: - Set Detect Scroll Action
       func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
       // Test the offset and calculate the current page after scrolling ends
       let pageWidth:CGFloat = scrollView.frame.width
       let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
       // Change the indicator
       self.PageControl.currentPage = Int(currentPage);
       // Change the text accordingly
    
        
       }

    
    
}
