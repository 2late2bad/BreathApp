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

    func createOnboardingCoordinator(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) -> OnboardingCoordinator {
        OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding, moduleFactory: moduleFactory)
    }

    func createAuthCoordinator() -> AuthCoordinator {
        AuthCoordinator(authManager: authManager, moduleFactory: moduleFactory)
    }

    func createMainCoordinator() -> MainCoordinator {
        MainCoordinator()
    }
}
