//
//  ViewController.swift
//  JSONTest01
//
//  Created by Koulutus on 03/10/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //First we try to read from Resources 
        let urlAAA = Bundle.main.url(forResource: "mytest", withExtension: "json")
        
        
        
        do{

            //Read contents to NSData structure
            let dataAAA = try Data(contentsOf : urlAAA!)
            
            let jsonAAA = try JSONSerialization.jsonObject(with: dataAAA, options: [])
           
            //create a handle to read Any type JSON object
            if let resultAAA = jsonAAA as? [String:Any]
            {
                if let iterAAA1 = resultAAA["firstname"] as? String
                {
                    NSLog(iterAAA1)
                }
            
                if let iterAAA2 = resultAAA["familyname"] as? String
                {
                    NSLog(iterAAA2)
                }
                
                if let iterAAA3 = resultAAA["age"] as? Int
                {
                    NSLog(String(iterAAA3))
                }
                
                if let iterAAA4 = resultAAA["childkey"] as? [String:Any] {
                    if let iterAAA41 = iterAAA4["childkeyToo"] as? String {
                        NSLog(iterAAA41)
                    }
                    
                }
                
                for (key, value) in resultAAA {
                    NSLog(key)
                }
                
                if let iterAAA5 = resultAAA["children"] as? [String] {
                    for object in iterAAA5 {
                        NSLog(object)
                    }
                }
                
                
            
            }
     
        }
        catch let MyError as NSError{
            print (MyError.description)
        }
        
        /*
         // We can read JSON file directly using URL of asset in internet
         //first there must the URL for id
         let urlBBB = URL(string: "https://jsonip.com")
         
         // Request is launched as a task, which works in a separate thread
         URLSession.shared.dataTask(with: urlBBB!, completionHandler: {
         (dataBBB, response, error) in
         guard let dataBBB = dataBBB, error == nil
         else { return }
         do {
         // Use JSON parser to decode data
         let jsonBBB = try JSONSerialization.jsonObject(with: dataBBB, options: [])
         
         // create a handle to read Any type JSON object
         if let resultBBB = jsonBBB as? [String:Any] {
         if let iterBBB4 = resultBBB["reject-fascism"] as? String {
         NSLog(iterBBB4)
         }
         }
         }
         catch let MyError as NSError
         {
         print(MyError.description)
         }
         }).resume()
         */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

