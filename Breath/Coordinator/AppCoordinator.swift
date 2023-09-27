//
//  AppCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit
import SwiftUI
import Combine
import Core

final class AppCoordinator: Coordinator {

    @Injected private var UDStorage: UDStorageManager

    private let window: UIWindow
    private let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    private var subsriptions = Set<AnyCancellable>()
    private let authManager: Authentification
    private let moduleFactory: ModuleFactory
    private var childCoordinators: [Coordinator]
    let coordinatorFactory: CoordinatorFactory
    var flowCompletionHandler: CoordinatorHandler?

    init(window: UIWindow,
         coordinatorFactory: CoordinatorFactory,
         authManager: Authentification,
         moduleFactory: ModuleFactory) {
        self.window = window
        window.makeKeyAndVisible()
        self.coordinatorFactory = coordinatorFactory
        self.authManager = authManager
        self.moduleFactory = moduleFactory
        childCoordinators = []
    }

    func start() {
        setupOnboardingValue()

        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] isFirstLaunch in
            guard let self else { return }
            if !isFirstLaunch {
                showOnboardingFlow()
            } else if authManager.userSession == nil {
                showAuthFlow()
            } else {
                showMainFlow()
            }
        }.store(in: &subsriptions)
    }
}

private extension AppCoordinator {

    func showOnboardingFlow() {
        let onboardingCoordinator = coordinatorFactory.createOnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
        onboardingCoordinator.start()
        childCoordinators.append(onboardingCoordinator)
        window.rootViewController = onboardingCoordinator.rootViewController
    }

    func showAuthFlow() {
        let authCoordinator = coordinatorFactory.createAuthCoordinator()
        authCoordinator.start()
        childCoordinators.append(authCoordinator)
        window.rootViewController = authCoordinator.rootViewController
        authCoordinator.flowCompletionHandler = { [weak self] in
            guard let self else { return }
            self.showMainFlow()
        }
    }

    func showMainFlow() {
        let mainCoordinator = coordinatorFactory.createMainCoordinator()
        mainCoordinator.start()
        childCoordinators.append(mainCoordinator)
        self.window.rootViewController = mainCoordinator.rootViewController
    }

    func setupOnboardingValue() {
        let value = UDStorage.bool(forKey: .firstRunApp)
        hasSeenOnboarding.send(value ?? false)

        hasSeenOnboarding
            .filter { $0 }
            .sink { [UDStorage] value in
                UDStorage.set(value, forKey: .firstRunApp)
            }
            .store(in: &subsriptions)
    }
}
