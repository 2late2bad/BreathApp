//
//  ModuleFactory.swift
//  Breath
//
//  Created by Alexander V. on 16.09.2023.
//

import UIKit

protocol ModuleFactoryProtocol {
    func createAuthModule(authManager: Authentification) -> AuthController
}

final class ModuleFactory: ModuleFactoryProtocol {

    func createAuthModule(authManager: Authentification) -> AuthController {
        let viewModel = AuthViewModel(authManager: authManager)
        let authVC = AuthController(viewModel: viewModel)
        return authVC
    }
}
