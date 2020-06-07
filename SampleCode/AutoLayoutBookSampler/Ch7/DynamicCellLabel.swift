//
//  DynamicCellLabel.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 10/27/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class DynamicCellLabel: UILabel {
    internal override func layoutSubviews() {
        self.preferredMaxLayoutWidth = self.bounds.width
        super.layoutSubviews()
    }
}
