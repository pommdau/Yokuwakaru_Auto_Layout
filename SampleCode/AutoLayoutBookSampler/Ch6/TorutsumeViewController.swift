//
//  TorutsumeViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 10/24/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class TorutsumeViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var swichButton: UISwitch!
    
    @IBOutlet weak var swichHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var swichTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    
    @IBAction func PressLabelButton(sender: AnyObject) {
        if label.text == nil {
            label.text = "Science without religion is lame, religion without science is blind."
            labelTopConstraint.constant = 8
        }
        else {
            label.text = nil
            labelTopConstraint.constant = 0
        }
    }
    
    @IBAction func PressButtonButton(sender: AnyObject) {
        if button.hidden {
            buttonHeightConstraint.constant = 30
            buttonTopConstraint.constant = 8
            button.hidden = false
        }
        else {            buttonHeightConstraint.constant = 0
            buttonTopConstraint.constant = 0
            button.hidden = true
        }
    }
    
    @IBAction func PressSwichButton(sender: AnyObject) {
        if swichButton.hidden {
            swichTopConstraint.constant = 8
            swichHeightConstraint.constant = 31
            swichButton.hidden = false
        }
        else {
            swichTopConstraint.constant = 0
            swichHeightConstraint.constant = 0
            swichButton.hidden = true
        }
    }
}
