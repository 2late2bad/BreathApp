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
    private let router: Router
    private let moduleFactory: ModuleFactory
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>
    var flowCompletionHandler: CoordinatorHandler?

    init(router: Router, hasSeenOnboarding: CurrentValueSubject<Bool, Never>, moduleFactory: ModuleFactory) {
        rootViewController = UIViewController()
        self.router = router
        self.moduleFactory = moduleFactory
        self.hasSeenOnboarding = hasSeenOnboarding
    }

    func start() {
        let view = moduleFactory.createOnboardingModule(hasSeenOnboarding: hasSeenOnboarding)
        router.push(UIHostingController(rootView: view), animated: true, completion: nil)
    }
}
