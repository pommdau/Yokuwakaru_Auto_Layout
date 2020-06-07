//
//  customView.swift
//  containerSample
//
//  Created by Yusuke Kawanabe on 10/4/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class XibAndStoryboard: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        Bundle.mainBundle().loadNibNamed("XibAndStoryboard", owner: self, options: nil)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.contentView)
        
        // 親ビューの四隅に制約をはる
        self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.layoutIfNeeded()
    }
    
    @IBAction func likeTapped(sender: AnyObject) {
        print("Like button tapped.")
    }
}

