//
//  ViewController.swift
//  QRCodeGenerate
//
//  Created by Koulutus on 18/10/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var lblCodeName: UILabel!
    @IBAction func button(_ sender: Any)
    {
        if let myString = myTextField.text
        {
           
            let data = myString.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            
            let img = UIImage(ciImage: (filter?.outputImage)!)
            myImageView.image = img
            
            lblCodeName.text = myString
            myTextField.text = ""
            myTextField.becomeFirstResponder()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTextField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

