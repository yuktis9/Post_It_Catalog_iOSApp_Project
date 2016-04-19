//
//  NotesCollectionViewController.swift
//  Project
//
//  Created by yukti sarwadia on 4/17/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class NotesCollectionViewController: UICollectionViewController {
    
   var Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Array = ["djs", "sdsdfsd", "sdfsdf", "hty"]
        
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
       
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
    
        let Button = cell.viewWithTag(1) as! UILabel
        
        Button.text = Array[indexPath.row]
        
        return cell
    }

    
}
