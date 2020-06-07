//
//  MultipleStoryboardsTabViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 10/7/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class MultipleStoryboardsTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewControllers()
    }
    
    func setupViewControllers() {
        guard let vc1 = UIStoryboard.sub1Storyboard().instantiateInitialViewController() else {return}
        guard let vc2 = UIStoryboard.sub2Storyboard().instantiateInitialViewController() else {return}
        
        self.viewControllers = [vc1, vc2]
    }
}

extension UIStoryboard {
    class func sub1Storyboard() -> UIStoryboard {
        return UIStoryboard(name: "MultipleStoryboardsSub1", bundle: nil)
    }
    
    class func sub2Storyboard() -> UIStoryboard {
        return UIStoryboard(name: "MultipleStoryboardsSub2", bundle: nil)
    }
}
