//
//  StatsViewController.swift
//  PictureGuess
//
//  Created by Ádibádi on 27/02/16.
//  Copyright © 2016 Székely Ádám. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var queriedPicturesCountLabel: UILabel!
    @IBOutlet weak var correctAnswersCountLabel: UILabel!
    @IBOutlet weak var wrongAnswersCountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        let pictureMgr = AppDelegate.sharedAppDelegate().pictureManager
        
        queriedPicturesCountLabel.text = "\(pictureMgr.picturesQueriedCount)"
        correctAnswersCountLabel.text = "\(pictureMgr.correctAnswerCount)"
        wrongAnswersCountLabel.text = "\(pictureMgr.wrongAnswerCount)"
        
        super.viewWillAppear(animated)
    }

}
