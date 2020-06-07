//
//  File.swift
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 6/5/16.
//  Copyright © 2016 Yusuke Kawanabe. All rights reserved.
//

import UIKit

extension UIView {
    func hasAmbiguity() -> Bool {
        // 戻り値用のフラグ
        var hasAmbiguity = false
        
        #if DEBUG
            if self.hasAmbiguousLayout() {
                print("\(self.description) : AMBIGUOUS")
                hasAmbiguity = true;
            }
            
            // サブビューがあれば曖昧かしらべる
            for view in subviews {
                if (view.hasAmbiguity()) {
                    hasAmbiguity = true;
                }
            }
        #endif
        
        return hasAmbiguity
    }
    
    func exerciseAmbiguityInLayoutRepeatedly(recursive: Bool) {
        
        if self.hasAmbiguousLayout() {
            NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(UIView.exerciseAmbiguityInLayout), userInfo: nil, repeats: true)
        }
        
        if recursive {
            for view in subviews {
                view .exerciseAmbiguityInLayoutRepeatedly(recursive)
            }
        }
    }
}

extension UIView {
    func commonSuperviewWith(target: UIView) -> UIView? {
        // selfを含んだ祖先ビューの配列を取得
        var hierarchy: [UIView] = [self]
        var current: UIView? = self
        while let view = current {
            hierarchy.append(view)
            current = view.superview
        }
        
        // 共通の祖先ビューを探す
        var currentTarget: UIView? = target
        while let candidate = currentTarget {
            if let _ = hierarchy.indexOf(candidate) {
                return candidate
            }
            currentTarget = candidate.superview
        }
        
        return nil
    }
    
    func constraintsReferringView(view: UIView) -> [NSLayoutConstraint] {
        var commonConstraints = [NSLayoutConstraint]()
        for constraint in constraints {
            if (constraint.firstItem as? UIView == view || constraint.secondItem as? UIView == view) {
                commonConstraints.append(constraint)
            }
        }
        return commonConstraints
    }
}
