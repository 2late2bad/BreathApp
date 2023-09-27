//
//  Dependencies.swift
//  Core
//
//  Created by Alexander V. on 27.09.2023.
//

public final class Dependencies {
    public static var userDefaultsProvider: () -> UDStorageManager {
        get { ServiceLocator.shared.resolve() }
        set { ServiceLocator.shared.register(newValue) }
    }
}
