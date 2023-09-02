//
//  Bundle+Ext.swift
//  UIComponents
//
//  Created by Alexander V. on 02.09.2023.
//

import Foundation

class BundleHandler {}

extension Bundle {
    static let uiComponents = Bundle(for: BundleHandler.self)
}
