//
//  AmbiguousLayoutWithPrivateMethodsViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 6/6/16.
//  Copyright © 2016 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class AmbiguousLayoutWithPrivateMethodsViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    // ビューの階層構造を出力
    @IBAction func recursiveDescriptionAction(sender: AnyObject) {
        textView.text = view.recursiveDescription()
        textView.textColor = UIColor.whiteColor()
    }

    // ビューの階層構造とAuto Layoutの情報を出力
    @IBAction func autolayoutTraceAction(sender: AnyObject) {
        textView.text = view._autolayoutTrace()
        textView.textColor = UIColor.whiteColor()
    }
    
    // ビューコントローラの階層を確認する
    @IBAction func printHierarchyAction(sender: AnyObject) {
        textView.text = self._printHierarchy()
        textView.textColor = UIColor.whiteColor()
    }
    
    // 全てのインスタンスを確認する
    @IBAction func ivarDescriptionAction(sender: AnyObject) {
        textView.text = self._ivarDescription()
        textView.textColor = UIColor.whiteColor()
    }
    
}
