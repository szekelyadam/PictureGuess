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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pictureMgr = AppDelegate.sharedAppDelegate().pictureManager
        
        var titles : [String]?
        
        pictureMgr.getRandomPicture(&baseImage, titles: &titles, pictureTitleIndex: &correctAnswer)
        
        for index in 1...titles!.count {
            var button = view.viewWithTag(index) as! UIButton
            button.setTitle(titles![index - 1], forState: .Normal)
        }
        
        let difficultyFactor = 1
        
        let cropSize = CGSize(width: 300/difficultyFactor, height: 200/difficultyFactor)
        let cropRect = CGRect(x: CGFloat(random() % Int(baseImage!.size.width - cropSize.width)), y: CGFloat(random() % Int(baseImage!.size.height - cropSize.height)), width: (cropSize.width * baseImage!.scale), height: (cropSize.height * baseImage!.scale))
        let croppedImageRef = CGImageCreateWithImageInRect(baseImage!.CGImage, cropRect)
        let croppedImage = UIImage(CGImage: croppedImageRef!, scale: baseImage!.scale, orientation: baseImage!.imageOrientation)
        pictureView.image = croppedImage
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
