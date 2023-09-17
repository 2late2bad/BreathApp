//
//  UIScreen+Ext.swift
//  Breath
//
//  Created by Alexander V. on 17.09.2023.
//

import UIKit

extension UIScreen {

    class var getWidth: CGFloat {
        self.main.bounds.size.width
    }

    class var getHeight: CGFloat {
        self.main.bounds.size.height
    }
}
