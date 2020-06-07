//
//  AddConstraintsViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 4/16/16.
//  Copyright © 2016 Yusuke Kawanabe. All rights reserved.
//


class AddConstraintsViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        let topConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 130.0)
        let leftConstraint = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 50.0)
        view.addConstraints([leftConstraint, topConstraint])
        
    }
}


