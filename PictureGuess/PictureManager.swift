//
//  PictureManager.swift
//  PictureGuess
//
//  Created by Ádibádi on 27/02/16.
//  Copyright © 2016 Székely Ádám. All rights reserved.
//

import UIKit

class PictureManager: NSObject {
    let pictures : [AnyObject]
    
    override init() {
        let filePath = NSBundle.mainBundle().pathForResource("Pictures", ofType: "plist")
        pictures = NSArray(contentsOfFile: filePath!)! as [AnyObject]
        
        super.init()
    }
    
    let kChoices = 3
    
    /**
    * picure: a picture chosen randomly
    * titles: randomly chosen unique picture titltes
    * pictureTitleIndex: index of the chosen picture's title in the titles array
    */
    func getRandomPicture(inout picture:UIImage?, inout titles:[String]?, inout pictureTitleIndex:Int) {
        // index of the selected picture in the pictures array
        let selectedPictureIndex = Int(arc4random_uniform(UInt32(pictures.count - 1)))
        
        // array with the indexes of the not chosen picture titles
        var rangeArray = [Int]()
        for index in 0..<pictures.count {
            rangeArray.append(index)
        }
        rangeArray.removeAtIndex(selectedPictureIndex)
        
        print("range array: \(rangeArray)")
        
        // choosing unique random picture titles
        var titlesToReturn = [String]()
        for _ in 0..<kChoices-1 {
            let randomIndex = Int(arc4random_uniform(UInt32(rangeArray.count - 1)))
            if let picture = pictures[rangeArray[randomIndex]] as? [String : String] {
                titlesToReturn.append(picture["title"]!)
            }
            rangeArray.removeAtIndex(randomIndex)
            print(rangeArray)
        }
        
        print("titles: \(titlesToReturn)")
        
        pictureTitleIndex = Int(arc4random_uniform(UInt32(kChoices)))
        if let chosenPicture = pictures[selectedPictureIndex] as? [String : String] {
            titlesToReturn.insert(chosenPicture["title"]!, atIndex: pictureTitleIndex)
            picture = UIImage(named: chosenPicture["image"]!)!
        }
        
        titles = titlesToReturn
    }
}
