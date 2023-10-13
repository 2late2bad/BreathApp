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
    private let rootViewController: UINavigationController
    private let appRouter: AppRouter
    private let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    private var subsriptions = Set<AnyCancellable>()
    private let authManager: Authentification
    private var childCoordinators: [Coordinator]
    let coordinatorFactory: CoordinatorFactory
    var flowCompletionHandler: CoordinatorHandler?

    init(window: UIWindow,
         coordinatorFactory: CoordinatorFactory,
         authManager: Authentification) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.isNavigationBarHidden = true
        appRouter = AppRouter(navigationController: rootViewController)
        self.coordinatorFactory = coordinatorFactory
        self.authManager = authManager
        childCoordinators = []
    }

    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
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
        let onboardingCoordinator = coordinatorFactory.createOnboardingCoordinator(router: appRouter,
                                                                                   hasSeenOnboarding: hasSeenOnboarding)
        onboardingCoordinator.start()
        childCoordinators.append(onboardingCoordinator)
    }

    func showAuthFlow() {
        let authCoordinator = coordinatorFactory.createAuthCoordinator(router: appRouter)
        authCoordinator.start()
        childCoordinators.append(authCoordinator)
        authCoordinator.flowCompletionHandler = { [weak self] in
            guard let self else { return }
            self.showMainFlow()
        }
    }

    func showMainFlow() {
        let mainCoordinator = coordinatorFactory.createMainCoordinator(router: appRouter)
        mainCoordinator.start()
        childCoordinators.append(mainCoordinator)
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
