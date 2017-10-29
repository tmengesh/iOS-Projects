//
//  ViewController.swift
//  Calculator
//
//  Created by Tewodros Mengesha on 20/09/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //variable declaration
    var isDivisionByZero = false
    var isTypingNumber = false //checks weather user is typing number or operator
    var firstNumber = 0.00
    var secondNumber = 0.00
    var operation = ""
    
    /* Reset variables */
    func resetAllValues(){
        isDivisionByZero = false
        isTypingNumber = false
        firstNumber = 0.00
        secondNumber = 0.00
        operation = ""
        lblDisplay.text = "0"
    }

   /* Number Tapped */
    @IBAction func numberTapped(_ sender: AnyObject) {
        
        let number = sender.currentTitle
        
        if isTypingNumber{
            //unrap label values and do string concatination
            lblDisplay.text = lblDisplay.text! + number!!

        } else {
            lblDisplay.text = number!
            isTypingNumber = true
        }
    }
    
   /* Number Tapped -  appends the pressed digit  */
    
    @IBAction func calculationTapped(_ sender: AnyObject) {
        isTypingNumber = false
        firstNumber = Double(lblDisplay.text!)!
        operation = sender.currentTitle!!
    }
    
    /* Calculation takes place here.... 
        picks the second number from the label, and does the calculation based on the operator choosen by the user
     */
    
    @IBAction func equalsTapped(_ sender: AnyObject) {
        isTypingNumber = false
        var result = 0.00
        var intResult = 0
        secondNumber = Double(lblDisplay.text!)!
        
        if operation == "÷" {
            if(secondNumber == 0) {isDivisionByZero = true} //Division by zero
            else {result = firstNumber/secondNumber}
        }else if operation == "+" {
            result = firstNumber + secondNumber
        }else if operation == "-" {
            result = firstNumber - secondNumber
        }else if operation == "x" {
            result = firstNumber * secondNumber
        }
        /*The following if checks weather the calculated result have floating value or not*/
        if(!isDivisionByZero)
            {
                if (result.truncatingRemainder(dividingBy: 1)==0) //then it is an integer
                {   intResult = Int(result)
                    lblDisplay.text = "\(intResult)"}
                else {lblDisplay.text = "\(result)"}
        }
        else
            {
                resetAllValues()
                lblDisplay.text = "Division by Zero, Error!!!"
                
            }
    }
    
    /* Button is used to make type number positive or negative works by adding and removing "-" sign beofore the number*/
    
    @IBAction func plusORminus(_ sender: UIButton) {
        
        var str = lblDisplay.text!
        //if given number has "-" remove the sign and make the number positive
        if (str.hasPrefix("-")){
            str.remove(at: (str.startIndex))
            lblDisplay.text = str
            
        }
            // if the number was positive, when the button is clicked add "-" to the value on user input
        else if (str == "0")
        {
            lblDisplay.text = "0"
        }
        else
        {
            lblDisplay.text = "-" + lblDisplay.text!
        }
        
    }
    
    @IBAction func calculatePercentage(_ sender: UIButton) {
        var input = Double(lblDisplay.text!)!
        input = (input/100)
        lblDisplay.text = "\(input)"
    }

    
    @IBAction func restValues(_ sender: UIButton) {
        resetAllValues()
    }
    @IBOutlet weak var lblDisplay: UILabel!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

