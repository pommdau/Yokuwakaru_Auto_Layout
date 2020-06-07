//
//  Timer.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 10/28/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit

class Timer: NSObject {
    static let sharedInstance = Timer()
    
    private var startTime: NSDate?
    func start() {
        startTime = NSDate()
    }
    
    func elapsedTime() {
        guard let time = startTime else {
            print("計測開始していません。")
            return
        }
        
        let elapsedTime = NSDate().timeIntervalSince(time as Date) as Double
        print("経過時間：\(elapsedTime)")
    }

}
