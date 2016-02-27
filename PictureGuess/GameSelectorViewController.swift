//
//  GameSelectorViewController.swift
//  PictureGuess
//
//  Created by Ádibádi on 27/02/16.
//  Copyright © 2016 Székely Ádám. All rights reserved.
//

import UIKit

class GameSelectorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var difficultySegmentedControl: UISegmentedControl!

    @IBAction func unwindToGameSelector(segue: UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let gameVC = segue.destinationViewController as! GameViewController
        gameVC.difficultyFactor = Double(difficultySegmentedControl.selectedSegmentIndex) + 1.0
    }

}
