//
//  Injected.swift
//  Core
//
//  Created by Alexander V. on 27.09.2023.
//

@propertyWrapper
public final class Injected<Service> {

    private let serviceLocator: ServiceLocator = ServiceLocator.shared
    private var service: Service?

    public init() {}

    public var wrappedValue: Service {
        guard let service = self.service else {
            let service: Service = serviceLocator.resolve()
            self.service = service
            return service
        }

        return service
    }
}
