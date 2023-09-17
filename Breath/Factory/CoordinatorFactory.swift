//
//  CoordinatorFactory.swift
//  Breath
//
//  Created by Alexander V. on 16.09.2023.
//

import UIKit

protocol CoordinatorFactoryProtocol: AnyObject {
    var authManager: Authentification { get }
    var moduleFactory: ModuleFactoryProtocol { get }
    func createAppCoordinator(window: UIWindow) -> AppCoordinator
    func createAuthCoordinator() -> AuthCoordinator
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {

    var authManager: Authentification
    var moduleFactory: ModuleFactoryProtocol

    init(authManager: Authentification, moduleFactory: ModuleFactoryProtocol) {
        self.authManager = authManager
        self.moduleFactory = moduleFactory
    }

    func createAppCoordinator(window: UIWindow) -> AppCoordinator {
        AppCoordinator(window: window, coordinatorFactory: self, authManager: authManager, moduleFactory: moduleFactory)
    }

    func createAuthCoordinator() -> AuthCoordinator {
        AuthCoordinator(navController: UINavigationController(), authManager: authManager, moduleFactory: moduleFactory)
    }
}
