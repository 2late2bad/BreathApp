//
//  CoordinatorFactoryImpl.swift
//  Breath
//
//  Created by Alexander V. on 16.09.2023.
//

import UIKit
import Combine

final class CoordinatorFactoryImpl: CoordinatorFactory {

    var authManager: Authentification
    var moduleFactory: ModuleFactory

    init(authManager: Authentification, moduleFactory: ModuleFactory) {
        self.authManager = authManager
        self.moduleFactory = moduleFactory
    }

    func createAppCoordinator(window: UIWindow) -> AppCoordinator {
        AppCoordinator(window: window, coordinatorFactory: self, authManager: authManager, moduleFactory: moduleFactory)
    }

    func createOnboardingCoordinator(presenter: Router,
                                     hasSeenOnboarding: CurrentValueSubject<Bool, Never>) -> OnboardingCoordinator {
        OnboardingCoordinator(presenter: presenter, hasSeenOnboarding: hasSeenOnboarding, moduleFactory: moduleFactory)
    }

    func createAuthCoordinator(presenter: Router) -> AuthCoordinator {
        AuthCoordinator(presenter: presenter, authManager: authManager, moduleFactory: moduleFactory)
    }

    func createMainCoordinator(presenter: Router) -> MainCoordinator {
        MainCoordinator(presenter: presenter)
    }
}
