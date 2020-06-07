//
//  LayoutGuideViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 10/19/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class LayoutGuideViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // レイアウトガイドを生成
        let space = UILayoutGuide()
        
        // レイアウトガイドを追加する
        view.addLayoutGuide(space)
        
        // レイアウトガイドの幅をボタンと揃える
        space.widthAnchor.constraint(equalTo: saveButton.widthAnchor).isActive = true
        
        // レイアウトガイドを中央揃え
        space.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // 各ボタンとレイアウトガイドの水平方向の制約生成
        saveButton.trailingAnchor.constraint(equalTo: space.leadingAnchor).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: space.trailingAnchor).isActive = true
        view.layoutIfNeeded()
    
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}


