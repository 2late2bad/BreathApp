//
//  ModuleFactory.swift
//  Breath
//
//  Created by Alexander V. on 27.09.2023.
//

import Foundation
import Combine
import OnboardSDK

protocol ModuleFactory {
    func createOnboardingModule(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) -> OnboardView
    func createAuthModule(authManager: Authentification) -> AuthController
}
