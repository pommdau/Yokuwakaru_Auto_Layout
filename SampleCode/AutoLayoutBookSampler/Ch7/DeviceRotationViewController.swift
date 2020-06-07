//
//  DeviceRotationViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 2/20/16.
//  Copyright © 2016 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class DeviceRotationViewController: UIViewController {

    @IBOutlet weak var detailLabelPortraitTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var detailLabelPortraitLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var detailLabelLandScapeTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var detailLabelLandScapeLeftConstraint: NSLayoutConstraint!
    
    // 縦画面時の制約を持つ配列
    var portraitConstraints: [NSLayoutConstraint]?
    // 横画面時の制約を持つ配列
    var landscapeConstraints: [NSLayoutConstraint]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        portraitConstraints = [detailLabelPortraitTopConstraint, detailLabelPortraitLeftConstraint]
        landscapeConstraints = [detailLabelLandScapeLeftConstraint, detailLabelLandScapeTopConstraint]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        // 回転時のレイアウト変更を以下のメソッド内で定義することで、回転時のアニメーションと同期して動きます。
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        coordinator.animate(
            alongsideTransition: {
                context in
                // 縦画面レイアウト
                if size.width <= size.height {
                    // 横画面用制約を無効化
                    NSLayoutConstraint.deactivate(self.landscapeConstraints ?? [])
                    
                    // 縦画面用制約を有効化
                    NSLayoutConstraint.activate(self.portraitConstraints ?? [])
                }
                // 横画面レイアウト
                else {
                    // 縦画面用制約を無効化
                    NSLayoutConstraint.deactivate(self.portraitConstraints ?? [])
                    
                    // 横画面用制約を有効化
                    NSLayoutConstraint.activate(self.landscapeConstraints ?? [])
                }
            }, completion: nil)
    }
}
