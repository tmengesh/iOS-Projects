//
//  main.swift
//  numberGuessingGame
//
//  Created by Koulutus on 19/09/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import Foundation

// Generate random number between 1...10
let randomNumber = Int(arc4random_uniform(10)) + 1;
var flag : Bool = false;

print("Number guessing game")
print("Please enter a number between 1 and 10")
var userInput : Int
repeat
{
    userInput = Int(readLine()!)!
    if (userInput > randomNumber)
    {
        print("Too high!")
    }
    else if (userInput < randomNumber)
    {
        print("Too low!")
    }
    else
    {
        print("That's exactly what I had in mind!")
        flag = true;
    }
    
} while (!flag);

