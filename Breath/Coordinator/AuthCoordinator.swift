//
//  AuthCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit
import SwiftUI

final class AuthCoordinator: Coordinator {

    private let router: Router
    private let authManager: Authentification
    private let moduleFactory: ModuleFactory
    var flowCompletionHandler: CoordinatorHandler?

    init(router: Router, authManager: Authentification, moduleFactory: ModuleFactory) {
        self.router = router
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
        router.push(controller, animated: true, completion: nil)
    }
}
