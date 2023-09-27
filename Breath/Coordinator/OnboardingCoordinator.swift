//
//  OnboardingCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import Foundation
import SwiftUI
import Combine

final class OnboardingCoordinator: Coordinator {

    var rootViewController: UIViewController
    private let moduleFactory: ModuleFactory
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>
    var flowCompletionHandler: CoordinatorHandler?

    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>, moduleFactory: ModuleFactory) {
        rootViewController = UIViewController()
        self.moduleFactory = moduleFactory
        self.hasSeenOnboarding = hasSeenOnboarding
    }

    func start() {
        let view = moduleFactory.createOnboardingModule(hasSeenOnboarding: hasSeenOnboarding)
        rootViewController = UIHostingController(rootView: view)
    }
}
