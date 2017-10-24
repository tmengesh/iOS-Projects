//
//  ViewController.swift
//  unitTestExample
//
//  Created by Koulutus on 22/10/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUserInput: UITextField!
    @IBOutlet weak var lblDisplayResult: UILabel!
    
    @IBAction func calculateFibonacci(_ sender: Any) {
      let input = Int(txtUserInput.text!)
        if input == 0
        {
            lblDisplayResult.text = ("0 is neutral and Fibonacci of O is 0")
        }
        else
        {
            let isEven = isNumberEven(num: input!)
            let result = fibonacci(n: input!)
          
            //(input ?? 0)  O is given as a default value otherwise the number will be displayed as Optional(input)
            if(isEven)
            {
                lblDisplayResult.text = ("\(input ?? 0) is even number and Fibonacci \(input ?? 0)) = \(result)")
            }
            else
            {
                lblDisplayResult.text = ("\(input ?? 0)  is odd number and Fibonacci \(input ?? 0)  = \(result)")
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUserInput.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func isNumberEven(num: Int) -> Bool
    {
        if (num % 2) == 0
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func fibonacci(n: Int) -> Int
    {
        // Some temporary variables.
        var a = 0
        var b = 1
        // Add up numbers to the desired iteration.
        for _ in 0..<n {
            let temp = a
            a = b
            b = temp + b
        }
        return a
    }
}


