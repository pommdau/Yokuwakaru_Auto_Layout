//
//  XibAndStoryboardViewController.swift
//  containerSample
//
//  Created by Yusuke Kawanabe on 8/16/15.
//  Copyright (c) 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
class XibAndStoryboardViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subView = XibAndStoryboard()
        subView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(subView)
        
        subView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        subView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        subView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
