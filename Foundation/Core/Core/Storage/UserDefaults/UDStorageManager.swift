//
//  UDStorageManager.swift
//  Core
//
//  Created by Alexander V. on 27.09.2023.
//

import Foundation

public protocol UDStorageManager: AnyObject {
    // Write
    func set(_ object: Any?, forKey key: UDStorageKeys)
    func set<T: Encodable>(object: T?, forKey key: UDStorageKeys)
    // Read
    func int(forKey key: UDStorageKeys) -> Int?
    func string(forKey key: UDStorageKeys) -> String?
    func dict(forKey key: UDStorageKeys) -> [String: Any]?
    func date(forKey key: UDStorageKeys) -> Date?
    func bool(forKey key: UDStorageKeys) -> Bool?
    func data(forKey key: UDStorageKeys) -> Data?
    func decodableData<T: Decodable>(forKey key: UDStorageKeys) -> T?
}
