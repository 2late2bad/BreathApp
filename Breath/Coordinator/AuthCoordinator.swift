//
//  AuthCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit
import SwiftUI

final class AuthCoordinator: Coordinator {

    var rootViewController: UINavigationController
    private let authManager: Authentification
    private let moduleFactory: ModuleFactoryProtocol
    var flowCompletionHandler: CoordinatorHandler?

    init(authManager: Authentification, moduleFactory: ModuleFactoryProtocol) {
        rootViewController = UINavigationController()
        self.authManager = authManager
        self.moduleFactory = moduleFactory
    }

    func start() {
        showAuthModule()
    }

    private func showAuthModule() {
        let controller = moduleFactory.createAuthModule(authManager: authManager)
        controller.completionHandler = { [weak self] _ in
            guard let self else { return }
            self.flowCompletionHandler?()
        }
        rootViewController.setViewControllers([controller], animated: false)
    }
}
