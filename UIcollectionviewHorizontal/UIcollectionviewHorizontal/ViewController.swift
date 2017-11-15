//
//  ViewController.swift
//  UIcollectionviewHorizontal
//
//  Created by Koulutus on 15/11/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var imageArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9"), ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionViewCell", for: indexPath)as! imageCollectionViewCell
        cell.imgImage.image = imageArray[indexPath.row]
        return cell
    }


}

