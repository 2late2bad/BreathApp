//
//  CoreFramework.swift
//  Breath
//
//  Created by Alexander V. on 27.09.2023.
//

import Core

final class CoreFramework {
    static func setup() {
        Core.Dependencies.userDefaultsProvider = { UserDefaultsProvider.instance }
    }
}
