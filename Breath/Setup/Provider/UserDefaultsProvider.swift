//
//  UserDefaultsProvider.swift
//  Breath
//
//  Created by Alexander V. on 27.09.2023.
//

import Foundation
import Core

final class UserDefaultsProvider {

    // MARK: - Properties
    public static let instance = UserDefaultsProvider()
    private let userDefaults = UserDefaults.standard

    // MARK: - Init
    private init() {}

    // MARK: - Private methods
    private func store(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }

    private func restore(for key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

// MARK: - UDStorageManager Impl
extension UserDefaultsProvider: UDStorageManager {

    public func set(_ object: Any?, forKey key: UDStorageKeys) {
        store(object, key: key.rawValue)
    }

    public func set<T: Encodable>(object: T?, forKey key: UDStorageKeys) {
        let jsonData = try? JSONEncoder().encode(object)
        store(jsonData, key: key.rawValue)
    }

    public func int(forKey key: UDStorageKeys) -> Int? {
        restore(for: key.rawValue) as? Int
    }

    public func string(forKey key: UDStorageKeys) -> String? {
        restore(for: key.rawValue) as? String
    }

    public func dict(forKey key: UDStorageKeys) -> [String: Any]? {
        restore(for: key.rawValue) as? [String: Any]
    }

    public func date(forKey key: UDStorageKeys) -> Date? {
        restore(for: key.rawValue) as? Date
    }

    public func bool(forKey key: UDStorageKeys) -> Bool? {
        restore(for: key.rawValue) as? Bool
    }

    public func data(forKey key: UDStorageKeys) -> Data? {
        restore(for: key.rawValue) as? Data
    }

    public func decodableData<T: Decodable>(forKey key: UDStorageKeys) -> T? {
        guard let data = restore(for: key.rawValue) as? Data else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    func remove(forKey key: UDStorageKeys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
