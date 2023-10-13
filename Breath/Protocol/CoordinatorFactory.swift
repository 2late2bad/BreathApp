//
//  CoordinatorFactory.swift
//  Breath
//
//  Created by Alexander V. on 27.09.2023.
//

import UIKit
import Combine

protocol CoordinatorFactory: AnyObject {
    var authManager: Authentification { get }
    var moduleFactory: ModuleFactory { get }
    func createAppCoordinator(window: UIWindow) -> AppCoordinator
    func createOnboardingCoordinator(router: Router,
                                     hasSeenOnboarding: CurrentValueSubject<Bool, Never>) -> OnboardingCoordinator
    func createAuthCoordinator(router: Router) -> AuthCoordinator
    func createMainCoordinator(router: Router) -> MainCoordinator
}
