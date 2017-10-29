//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Tewodros Mengesha on 29/10/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // used to check where a player placed what
    
    //Winning numbers
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    @IBOutlet weak var label: UILabel!
    @IBAction func action(_ sender: Any)
    {
        //Player X can not override player Y's game piece
       if (gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true)
        {
            //Once play X or Y make a move the gameState clicked on change value from 0 to activePlayer
            gameState[(sender as AnyObject).tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                (sender as AnyObject).setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                (sender as AnyObject).setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        //Lets check if one of the player's won (check from the winningCombination array)
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    label.text = "CROSS HAS WON!"
                    
                }
                else
                {
                    label.text = "NOUGHT HAS WON!"
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }
        
        var count = 1
        
        if gameIsActive == true{
            for i in gameState{
                count = i*count
            }
            if count != 0
            {
                label.text = "IT WAS A DRAW"
                label.isHidden = false
                playAgainButton.isHidden = false
            }
        }
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject)
    {
       //Reset all values
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

