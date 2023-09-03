//
//  AppCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit
import SwiftUI

final class AppCoordinator: Coordinator {

    let window: UIWindow
    var childCoordinators: [Coordinator]

    init(window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
        childCoordinators = []
    }

    func start() {
//        let onboardingCoordinator = OnboardingCoordinator()
//        onboardingCoordinator.start()
//        self.childCoordinators = [onboardingCoordinator]
//        window.rootViewController = onboardingCoordinator.rootViewController

        let authCoordinator = AuthCoordinator()
        authCoordinator.start()
        self.childCoordinators = [authCoordinator]
        window.rootViewController = authCoordinator.rootViewController

//        let mainCoordinator = MainCoordinator()
//        mainCoordinator.start()
//        self.childCoordinators = [mainCoordinator]
//        self.window.rootViewController = mainCoordinator.rootViewController
    }
}
