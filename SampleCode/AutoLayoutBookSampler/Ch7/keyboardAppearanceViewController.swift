//
//  keyboardAppearanceViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 11/1/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class keyboardAppearanceViewController: UIViewController {
    @IBOutlet weak var buttomConstraint: NSLayoutConstraint!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardAppearanceViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardAppearanceViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }

    func keyboardWillShow(notification: NSNotification) {
        guard let info = notification.userInfo else {
            fatalError("Unexpected notification")
        }

        // キーボードの高さを取得
        guard let keyboardHeight = info[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size.height else {
            fatalError("No keyboard height found")
        }
        
        // キーボード表示アニメーションの時間を取得
        guard let animationDuration = info[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue else {
            fatalError("No keyboard height found")
        }
        
        // 取得した情報を元にスクロールビューのレイアウトを変更する
        buttomConstraint.constant = keyboardHeight
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        guard let info = notification.userInfo else {
            fatalError("Unexpected notification")
        }
        
        // キーボード表示アニメーションの時間を取得
        guard let animationDuration = info[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue else {
            fatalError("No keyboard height found")
        }
        
        // 取得した情報を元にスクロールビューのレイアウトを変更する
        buttomConstraint.constant = 0
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    

    @IBAction func tapGesture(sender: AnyObject) {
        self.view.endEditing(true)
    }
}



