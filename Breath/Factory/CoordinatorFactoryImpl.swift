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
        AppCoordinator(window: window, coordinatorFactory: self, authManager: authManager)
    }

    func createOnboardingCoordinator(router: Router,
                                     hasSeenOnboarding: CurrentValueSubject<Bool, Never>) -> OnboardingCoordinator {
        OnboardingCoordinator(router: router, hasSeenOnboarding: hasSeenOnboarding, moduleFactory: moduleFactory)
    }

    func createAuthCoordinator(router: Router) -> AuthCoordinator {
        AuthCoordinator(router: router, authManager: authManager, moduleFactory: moduleFactory)
    }

    func createMainCoordinator(router: Router) -> MainCoordinator {
        MainCoordinator(router: router)
    }
}
