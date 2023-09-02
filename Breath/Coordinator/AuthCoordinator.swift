//
//  AuthCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit
import AuthSDK

final class AuthCoordinator: Coordinator {

    var rootViewController = UIViewController()

    lazy var authViewController: AuthViewController = {
        let authVC = AuthViewController()
        return authVC
    }()

    func start() {
        rootViewController = authViewController
    }
}
