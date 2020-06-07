//
//  SelfSizingCellTableViewCell.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 10/27/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class SelfSizingCellTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func layoutWithData(data: Person?) {
        titleLabel.text = data?.name
        detailLabel.text = data?.detail
    }
}

