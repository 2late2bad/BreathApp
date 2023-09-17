//
//  AppCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit
import SwiftUI

final class AppCoordinator: Coordinator {

    private let window: UIWindow
    private let authManager: Authentification
    private let moduleFactory: ModuleFactoryProtocol
    private var childCoordinators: [Coordinator]
    weak var coordinatorFactory: CoordinatorFactoryProtocol?
    var flowCompletionHandler: CoordinatorHandler?

    init(window: UIWindow,
         coordinatorFactory: CoordinatorFactoryProtocol?,
         authManager: Authentification,
         moduleFactory: ModuleFactoryProtocol) {
        self.window = window
        self.coordinatorFactory = coordinatorFactory
        self.authManager = authManager
        self.moduleFactory = moduleFactory
        window.makeKeyAndVisible()
        childCoordinators = []
    }

    func start() {
        let isFirstRun = false

        if isFirstRun {
            // showOnboardingFlow()
        } else if authManager.userSession == nil {
            showAuthFlow()
        } else {
            showMainFlow()
        }
    }
}

private extension AppCoordinator {

    func showOnboardingFlow() {
        let onboardingCoordinator = OnboardingCoordinator()
        onboardingCoordinator.start()
        childCoordinators.append(onboardingCoordinator)
        window.rootViewController = onboardingCoordinator.rootViewController
    }

    func showAuthFlow() {
        let authCoordinator = coordinatorFactory!.createAuthCoordinator() // todo: Возможен ли здесь безопасный unwrap?
        authCoordinator.start()
        childCoordinators.append(authCoordinator)
        window.rootViewController = authCoordinator.rootViewController
        authCoordinator.flowCompletionHandler = { [weak self] in
            guard let self else { return }
            self.showMainFlow()
        }
    }

    func showMainFlow() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        childCoordinators.append(mainCoordinator)
        self.window.rootViewController = mainCoordinator.rootViewController
    }
}
