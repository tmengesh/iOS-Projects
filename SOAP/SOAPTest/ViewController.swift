//
//  ViewController.swift
//  SOAPTest
//
//  Created by Koulutus on 24/10/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDataDelegate, URLSessionDelegate, URLSessionTaskDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //
        // First we need to create a SOAP message
        //
        
        var MySOAPMessage : String = ""
        
        // All SOAP messages use XML coding and they are defined in www.w3.org
        // Following code creates beginning of SOAP Envelope that holds SOAP message
        // encodingStyle sets default SOAP encoding and data types!
        MySOAPMessage += "<?xml version='1.0' encoding='utf-8'?>"
        MySOAPMessage += "<SOAP-ENV:Envelope"
        MySOAPMessage += " "
        MySOAPMessage += "xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'"
        MySOAPMessage += " "
        MySOAPMessage += "xmlns:xsd='http://www.w3.org/2001/XMLSchema'"
        MySOAPMessage += " "
        MySOAPMessage += "xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/'"
        MySOAPMessage += " "
        MySOAPMessage += "SOAP-ENV:encodingStyle='http://www.w3.org/2001/12/soap-encoding'"
        MySOAPMessage += ">"
        
        // Next SOAP messages have a header
        // This is optional part of the message envelope
        MySOAPMessage += "<SOAP-ENV:Header>"
        
        // SOAP Header has two attributes:
        // Actor = sets intermediate node that performs some precessing
        // before sending SOAP message deeper into server.
        // MustUnderstand = defines whether Header attribute is mandatory
        // If mandatory, the intermediate node must be set.
        
        // Next SOAP messages must close header
        MySOAPMessage += "</SOAP-ENV:Header>"
        
        // Next SOAP messages have a body
        // This is mandatory
        
        // Body can have two types of activity:
        // a) It asks something and gets a return message
        // b) It sends something and gets a return message
        
        // At this point the relevant service must be found:
        //
        // https://www.w3schools.com/xml/tempconvert.asmx?WSDL
        //
        // Find following data:
        // a) Service Address
        // types -> Schema -> targetNamespace
        // https://www.w3schools.com/xml/
        // b) Name of service to be used
        // Binding -> Operation Name
        // FahrenheitToCelsius
        // c) Format of input and output
        // types -> Schema -> element (FahrenheitToCelsius) -> ComplexType
        // Inside is one element which has name Fahrenheit and type is string
        // Fahrenheit of string datatype
        
        MySOAPMessage += "<SOAP-ENV:Body>"
        MySOAPMessage += "<CelsiusToFahrenheit xmlns='https://www.w3schools.com/xml/'>"
        MySOAPMessage += "<Celsius>"
        MySOAPMessage += "10"
        MySOAPMessage += "</Celsius>"
        MySOAPMessage += "</CelsiusToFahrenheit>"
        
        /*
         // Next SOAP messages should have a fault handling
         MySOAPMessage += "<SOAP-ENV:Fault>"
         // Error handling is actually user defined error code.
         MySOAPMessage += "<faultstring xsi:type = 'xsd:string'>"
         MySOAPMessage += "ERROR MESSAGE 666!"
         MySOAPMessage += "</faultstring>"
         // Next SOAP messages must close a fault handling
         MySOAPMessage += "</SOAP-ENV:Fault>"
         */
        
        // Next SOAP messages must close body
        MySOAPMessage += "</SOAP-ENV:Body>"
        
        // Next SOAP messages must close SOAP message envelope
        MySOAPMessage += "</SOAP-ENV:Envelope>"
        
        NSLog(MySOAPMessage)
        
        // The SOAP message must be sent to a suitable web service
        // This web service has URI which is located with URL
        let urlString = "https://www.w3schools.com/xml/tempconvert.asmx"
        let url = NSURL(string: urlString)
        
        // SOAP message length equals number of elements within SOAP message
        // This is actually number of characters to be sent within message
        let SOAPMsgLength = String(MySOAPMessage.characters.count)
        
        // Create actual SOAP request by adding information that is needed in header
        // Values must match the SOAP service's values - following values are "typical"
        let MyRequest = NSMutableURLRequest(url: url! as URL)
        MyRequest.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        MyRequest.addValue(SOAPMsgLength, forHTTPHeaderField: "Content-Length")
        MyRequest.httpMethod = "POST"
        MyRequest.httpBody = MySOAPMessage.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        // Following iOS 9 the NSURLConnection was changed to NSURLSession
        // Following code creates a NSURLSession that uses default queue
        // of iOS phone  and sets delegate to this class so task's returning
        // events are handled in this file.
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration:config, delegate: self as URLSessionDelegate, delegateQueue: OperationQueue.main)
        
        // This is typical asynchronic data fetching request
        // completitionhandler is used to deal with results
        let MyTask = session.dataTask(with: MyRequest as URLRequest,
                                      completionHandler: { (data, response, error) in
                                        if let response = response {
                                            let result : String = response.description
                                            NSLog(result)
                                        }
                                        if let error = error {
                                            NSLog(error as! String)
                                        }
                                        
        })
        
        MyTask.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

