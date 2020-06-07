//
//  ConflictedConstraintsViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 11/15/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class ConflictedConstraintsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
 
    @IBAction func constraintsAffectingLayoutForAxisAction(sender: AnyObject) {
        // 軸ごとに制約を分解する
        textView.text = textView.constraintsAffectingLayoutForAxis(.Horizontal).description
        textView.textColor = UIColor.whiteColor()
    }
    
    @IBAction func constraintsReferringViewAction(sender: AnyObject) {
        // ビューごとに制約を分解する
        textView.text = view.constraintsReferringView(textView).description
        textView.textColor = UIColor.whiteColor()
    }
}

