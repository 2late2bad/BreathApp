//
//  ServiceLocator.swift
//  Core
//
//  Created by Alexander V. on 27.09.2023.
//

protocol ServiceLocating {
    func register<T>(_ service: @escaping () -> T)
    func clearServices()
    func resolve<T>() -> T
}

final class ServiceLocator: ServiceLocating {

    // MARK: - Initalizers

    init() {}

    // MARK: - Properties

    static let shared = ServiceLocator()
    private var container: [ObjectIdentifier: Any] = [:]

    // MARK: - Actions

    func register<T>(_ service: @escaping () -> T) {
        container[ObjectIdentifier(T.self)] = service
    }

    func clearServices() {
        container = [:]
    }

    func resolve<T>() -> T {
        guard let service = container[ObjectIdentifier(T.self)] as? () -> T else {
            preconditionFailure("Could not locate \(T.self)")
        }

        return service()
    }
}
