//
//  ViewController.swift
//  FMDBTest01
//
//  Created by Koulutus on 04/10/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIAlertViewDelegate {

    var names : [String]?
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var familyname: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var status: UILabel!
    
    @IBAction func btnDeleteRecord(_ sender: UIButton) {
        
        if FileManager.default.fileExists(atPath: dbpath)
        {
            // NO DB found so it mush be created now
            let connectiontoFMDB = FMDatabase(path: dbpath)
            
            
            //conenction to DB must be opened
            
            if(connectiontoFMDB.open())
            {
                
                let sqlstatement =   "DELETE FROM person WHERE firstname = '\(self.firstname.text!)';"
                
                let result = connectiontoFMDB.executeUpdate(sqlstatement, withArgumentsIn: [])
                clearAll()
                self.status.text = "Record has been deleted"
                NSLog(connectiontoFMDB.debugDescription)
                
                if !result
                {
                    self.status.text = "DELETE FAILUE!"
                }
                NSLog(connectiontoFMDB.debugDescription)
                
                
            }
            connectiontoFMDB.close()
        }
        clearAll()
    }
    
    @IBAction func btnUpdateRecord(_ sender: UIButton) {
        

         if FileManager.default.fileExists(atPath: dbpath)
         {

         let connectiontoFMDB = FMDatabase(path: dbpath)
         
         
  
         
         if(connectiontoFMDB.open())
         {
         
            let sqlstatement = "UPDATE person SET firstname = '\(self.firstname.text!)', familyname = '\(self.familyname.text!)', phone = '\(self.phone.text!)' WHERE firstname = ('\(self.firstname.text!)');"
         
            let result = connectiontoFMDB.executeUpdate(sqlstatement, withArgumentsIn: [])
     
            self.status.text = "Record has been updated"
            NSLog(connectiontoFMDB.debugDescription)
         
            if !result
                {
                    self.status.text = "UPDATE FAILUE!"
                }
            NSLog(connectiontoFMDB.debugDescription)
         
         }
         connectiontoFMDB.close()
        }
        clearAll()

        
    }
    @IBAction func btnSave(_ sender: UIButton) {

        
        if FileManager.default.fileExists(atPath: dbpath)
        {
            // NO DB found so it mush be created now
            let connectiontoFMDB = FMDatabase(path: dbpath)
            
            
            //conenction to DB must be opened
            
            if(connectiontoFMDB.open())
            {
                if(self.firstname.text == "")
                {
                    self.status.text = "Please enter name "
                    self.firstname.becomeFirstResponder()
                }
                
                else
                {
                    let sqlstatement = "insert into person (firstname, familyname, phone) values ('\(self.firstname.text!)', '\(self.familyname.text!)', '\(self.phone.text!)');"
                    
                    let result = connectiontoFMDB.executeUpdate(sqlstatement, withArgumentsIn: [])
                    self.status.text = "Name has been added to the database"
                    NSLog(connectiontoFMDB.debugDescription)
                    
                    if !result
                    {
                        self.status.text = "SAVE FAILUE!"
                    }
                    NSLog(connectiontoFMDB.debugDescription)
                
                }
                let sqlstatement = "insert into person (firstname, familyname, phone) values ('\(self.firstname.text!)', '\(self.familyname.text!)', '\(self.phone.text!)');"
                
                let result = connectiontoFMDB.executeUpdate(sqlstatement, withArgumentsIn: [])
                self.status.text = "Name has been added to the database"
                NSLog(connectiontoFMDB.debugDescription)
                
                if !result
                {
                    self.status.text = "SAVE FAILUE!"
                }
                NSLog(connectiontoFMDB.debugDescription)
                
                
            }
            connectiontoFMDB.close()
        }
        clearAll()
    }

   
    @IBAction func btnLoad(_ sender: UIButton) {
        
        
        let connectiontoFMDB = FMDatabase(path: dbpath)
        
        if FileManager.default.fileExists(atPath: dbpath)
        {
            // NO DB found so it mush be created now
            let connectiontoFMDB = FMDatabase(path: dbpath)
            
            
            //conenction to DB must be opened
            
            if(connectiontoFMDB.open())
            {
                let sqlstatement = "select familyname, phone from person where firstname =  ('\(self.firstname.text!)');"

                
                let resultset:FMResultSet? = connectiontoFMDB.executeQuery(sqlstatement, withArgumentsIn: [])
                
                if resultset?.next() == true
                {
                    self.familyname.text = resultset?.string(forColumn: "familyname")
                    self.phone.text = resultset?.string(forColumn: "phone")
                    self.status.text = "Record found!"
                }
                else
                {
                    //self.status.text = "QUERY FAILURE!"
                }
                
                NSLog(connectiontoFMDB.debugDescription)
                
            }
            connectiontoFMDB.close()
        }
    }
    
    var dbpath: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstname.becomeFirstResponder() //set focus on first text box
        // Do any additional setup after loading the view, typically from a nib.
        //we use default filemanager in this exercise
        //Find path to databse by finding the document directory first
        
        let pathdummy = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        //The path to DB location is set into document directory root and name of DB is set as
        //mydatabse.db
        
        //firstname.becomeFirstResponder()
        dbpath = pathdummy[0].appendingPathComponent("mydatabase.db").path
        //NSLog(dbpath)

        
        if FileManager.default.fileExists(atPath: dbpath)
        {
            // NO DB found so it mush be created now
            let connectiontoFMDB = FMDatabase(path: dbpath)
           
            //conenction to DB must be established
            
            if(connectiontoFMDB.open())
            {
                let sqlstatement = "create table if not exists person (id integer primary key autoincrement, firstname text, familyname text, phone integer);"
                connectiontoFMDB.executeStatements(sqlstatement)
                NSLog(connectiontoFMDB.debugDescription)
            
            }
            connectiontoFMDB.close()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func clearAll()
    {
        firstname.text = ""
        firstname.becomeFirstResponder()
        familyname.text = ""
        phone.text = ""
        status.text = ""
        
    }
 
}

