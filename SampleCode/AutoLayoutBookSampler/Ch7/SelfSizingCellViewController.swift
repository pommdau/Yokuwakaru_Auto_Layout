//
//  SelfSizingCellViewController.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 10/27/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class SelfSizingCellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var people = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up auto resizing cell
        self.tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
        
        people = People.generateCellData()
        
        // Dynamic Typeのための通知受け取り
        NotificationCenter.default.addObserver(self, selector:#selector(didChangePreferredContentSize(notification:)), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func didChangePreferredContentSize(notification: NSNotification) {
        tableView.reloadData()
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルの取得
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelfSizingCellTableViewCell", for: indexPath as IndexPath) as? SelfSizingCellTableViewCell else {
            fatalError("Your cellIdentifier is invalid")
        }
        
        // データを渡しレイアウト実行
        cell.layoutWithData(data: self.personForRow(index: indexPath.row))
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: Person Array
    func personForRow(index: NSInteger) -> Person? {
        return people[index];
    }
}



