//
//  ViewController.swift
//  YouTubeEmbed
//
//  Created by Sebastian Hette on 31.01.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getVideo(videoCode: "Q0CbN8sfihY")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getVideo(videoCode:String)
    {
        let url = URL(string: "https://www.youtube.com/watch?v=\(videoCode)")
        
        //https://www.youtube.com/watch?v=Q0CbN8sfihY
        myWebView.loadRequest(URLRequest(url: url!))
    }


}

