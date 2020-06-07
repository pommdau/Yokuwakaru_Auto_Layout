//
//  AmbiguousLayoutViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 6/6/16.
//  Copyright © 2016 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class AmbiguousLayoutViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // 曖昧なレイアウトを持つラベルを定義
        let ambiguousLabel = UILabel()
        ambiguousLabel.text = "曖昧なラベル"
        ambiguousLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ambiguousLabel)
        
        // 制約を垂直方向のみに与える
        ambiguousLabel.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        
        // 曖昧なレイアウトか確認
        print(view.hasAmbiguity())
        
        // 8.2.2 曖昧なレイアウトを視覚で確認する
        view.exerciseAmbiguityInLayoutRepeatedly(true)
    }
}
