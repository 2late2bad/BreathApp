//
//  UIView+Ext.swift
//  Breath
//
//  Created by Alexander V. on 12.09.2023.
//

import UIKit.UIView

extension UIView {
    func addSubviews(_ views: UIView...) { views.forEach { addSubview($0) } }
}
