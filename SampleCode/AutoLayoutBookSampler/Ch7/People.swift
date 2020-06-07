//
//  People.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 10/27/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

import UIKit


struct Person {
    let name: String
    let detail: String
    
    init (name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}


private let numberOfData = 100
class People: NSObject {
    
        class func generateCellData() -> [Person] {
            var people = [Person]()
            
            var plistArray: NSArray?
            if let path = NSBundle.mainBundle().pathForResource("people", ofType: "plist") {
                plistArray = NSArray(contentsOfFile: path)
            }
            
            for _ in 0..<numberOfData {
                let index = Int(arc4random_uniform(UInt32(plistArray!.count)))
                let personDic = plistArray![index]
                
                let name = personDic["name"] as? String
                let detail = personDic["detail"] as? String
                
                let person = Person(name: name!, detail: detail!)
                people.append(person)
            }
            
            return people
    }
}
