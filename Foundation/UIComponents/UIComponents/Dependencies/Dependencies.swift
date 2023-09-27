//
//  Dependencies.swift
//  UIComponents
//
//  Created by Alexander V. on 27.09.2023.
//

import UIKit

public final class Dependencies {
    public static func setup() {
        UIFont.registerFonts(from: Bundle.uiComponents)
    }
}
