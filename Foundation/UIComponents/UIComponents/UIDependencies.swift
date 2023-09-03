//
//  UIDependencies.swift
//  UIComponents
//
//  Created by Alexander V. on 03.09.2023.
//

import UIKit

public final class UIDependencies {

    public static let shared = UIDependencies()
    private init() {}

    public func registerFonts() {
        UIFont.registerFonts(from: Bundle.uiComponents)
    }
}
