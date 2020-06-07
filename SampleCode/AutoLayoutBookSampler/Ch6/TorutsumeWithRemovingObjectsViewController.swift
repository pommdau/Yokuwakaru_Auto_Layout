//
//  TorutsumeWithRemovingObjectsViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 6/4/16.
//  Copyright © 2016 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class TorutsumeWithRemovingObjectsViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBAction func PressLabelButton(sender: AnyObject) {
        if label != nil {
            label.removeFromSuperview()
            label = nil;
        }
    }
}