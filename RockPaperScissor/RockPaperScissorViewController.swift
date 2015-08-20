//
//  RockPaperScissorViewController.swift
//  RockPaperScissor
//
//  Created by Kent Huang on 8/19/15.
//  Copyright (c) 2015 Kent Huang. All rights reserved.
//

import UIKit

class RockPaperScissorViewController: UIViewController {
    
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // code
    @IBAction func playRock(sender: UIButton) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        controller.playerPlay = "Rock"
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    // segue with code
    @IBAction func playPaper(sender: UIButton) {
        performSegueWithIdentifier("play", sender: sender)
    }

    // segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultsViewController
        if sender as! UIButton == paperButton {
            controller.playerPlay = "Paper"
        }
        
        if sender as! UIButton == scissorButton {
            controller.playerPlay = "Scissor"
        }
    }
    
}

