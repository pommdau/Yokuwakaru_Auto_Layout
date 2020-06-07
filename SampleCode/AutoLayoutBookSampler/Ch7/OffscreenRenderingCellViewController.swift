//
//  OffscreenRenderingCellViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 10/27/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class OffscreenRenderingCellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var people = [Person]()
    var cellHeights = [Int: CGFloat]()
    var start: NSDate?
    var cellForCalculatingHeight: OffscreenRenderingCellTableViewCell?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        people = People.generateCellData()
        tableView.estimatedRowHeight = 100.0
    }
    
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OffscreenRenderingCell") as? OffscreenRenderingCellTableViewCell
        cell!.layoutWithData(people[indexPath.row])
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        // セル生成時の計算コストを減らすため一度だけインスタンス化
        if cellForCalculatingHeight == nil {
            guard let reusableCell = tableView.dequeueReusableCellWithIdentifier("OffscreenRenderingCell") as? OffscreenRenderingCellTableViewCell else {
                fatalError("Your cellIdentifier is invalid")
            }
            cellForCalculatingHeight = reusableCell
        }
        
        // 再利用セルのアンラップ
        guard let cell = cellForCalculatingHeight else {
            fatalError("Cell is nil")
        }
        

        // レイアウト用データを代入
        cell.layoutWithData(self.personForRow(indexPath.row))
        
        // レイアウトに必要なテーブルビューの幅を与える
        cell.bounds = CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds))
        
        // セルの高さを計算する
        return cell.calculateHeight()
    }
    
    // MARK: Person Array
    func personForRow(index: NSInteger) -> Person? {
        return people[index];
    }
}

extension UITableViewCell {
    func calculateHeight() -> CGFloat {
        self.layoutIfNeeded()

        let cellHeight = contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
        
//         セパレータの高さ1.0を足す
        return cellHeight + 1.0
    }
}