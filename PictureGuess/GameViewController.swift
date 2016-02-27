//
//  GameViewController.swift
//  PictureGuess
//
//  Created by Ádibádi on 27/02/16.
//  Copyright © 2016 Székely Ádám. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var pictureView: UIImageView!
    
    var correctAnswer = -1
    var baseImage : UIImage?
    
    var difficultyFactor : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pictureMgr = AppDelegate.sharedAppDelegate().pictureManager
        
        var titles : [String]?
        
        pictureMgr.getRandomPicture(&baseImage, titles: &titles, pictureTitleIndex: &correctAnswer)
        
        for index in 1...titles!.count {
            let button = view.viewWithTag(index) as! UIButton
            button.setTitle(titles![index - 1], forState: .Normal)
        }
        
        let cropSize = CGSize(width: 300/difficultyFactor, height: 200/difficultyFactor)
        let cropRect = CGRect(x: CGFloat(random() % Int(baseImage!.size.width - cropSize.width)), y: CGFloat(random() % Int(baseImage!.size.height - cropSize.height)), width: (cropSize.width * baseImage!.scale), height: (cropSize.height * baseImage!.scale))
        let croppedImageRef = CGImageCreateWithImageInRect(baseImage!.CGImage, cropRect)
        let croppedImage = UIImage(CGImage: croppedImageRef!, scale: baseImage!.scale, orientation: baseImage!.imageOrientation)
        pictureView.image = croppedImage
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let button = sender as? UIButton {
            let resultsVC : ResultsViewController = segue.destinationViewController as! ResultsViewController
            resultsVC.picture = baseImage
            
            if button.tag-1 == correctAnswer {
                resultsVC.caption = "Great answer 😎 It's a \(button.titleLabel!.text!)"
                
                AppDelegate.sharedAppDelegate().pictureManager.correctAnswerCount++
            } else {
                let correctButton = view.viewWithTag(correctAnswer+1) as? UIButton
                resultsVC.caption = "You missed it 😞 It's a \(correctButton!.titleLabel!.text!)"
                
                AppDelegate.sharedAppDelegate().pictureManager.wrongAnswerCount++
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
