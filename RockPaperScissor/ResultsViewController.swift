//
//  ResultsViewController.swift
//  RockPaperScissor
//
//  Created by Kent Huang on 8/19/15.
//  Copyright (c) 2015 Kent Huang. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var playerPlay: String?
    var computerPlay: String?

    @IBOutlet weak var resultsImage: UIImageView!
    @IBOutlet weak var resultsLabel: UILabel!
    
    func generatePlay() {
        var choices = ["Rock", "Paper", "Scissor"]
        let roll = Int(arc4random_uniform(3))
        computerPlay = choices[roll]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        generatePlay()
        
        println("player: " + playerPlay!)
        println("computer: " + computerPlay!)
                
        if playerPlay! == computerPlay! {
            resultsImage.image = UIImage(named: "itsATie")
            resultsLabel.text = "It's a tie"
            return
        }
        
        var playerWon: Bool = false
        
        switch playerPlay! {
        case "Paper":
            playerWon = (computerPlay == "Rock")
        case "Rock":
            playerWon = (computerPlay == "Scissor")
        case "Scissor":
            playerWon = (computerPlay == "Paper")
        default:
            print("error player choice is nil")
        }
        
        resultsImage.image = playerWon ? UIImage(named: playerPlay! + "Wins") : UIImage(named: computerPlay! + "Wins")
        resultsLabel.text = "Computer chose \(computerPlay!). " + (playerWon ? "You Win!" : "You Lose :(")
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
