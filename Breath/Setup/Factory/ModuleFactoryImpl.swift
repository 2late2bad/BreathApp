//
//  ModuleFactoryImpl.swift
//  Breath
//
//  Created by Alexander V. on 16.09.2023.
//

import UIKit
import Combine
import OnboardSDK

final class ModuleFactoryImpl: ModuleFactory {

    func createOnboardingModule(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) -> OnboardView {
        OnboardView { hasSeenOnboarding.send(true) }
    }

    func createAuthModule(authManager: Authentification) -> AuthController {
        let viewModel = AuthViewModel(authManager: authManager)
        let authVC = AuthController(viewModel: viewModel)
        return authVC
    }
}
