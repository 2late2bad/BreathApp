//
//  HealthTabCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit

final class HealthTabCoordinator: Coordinator {

    var rootViewController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    init() {
        rootViewController = UINavigationController()
    }

    lazy var healthViewController: UIViewController = {
        let healthVC = UIViewController()
        healthVC.title = "Health"
        healthVC.view.backgroundColor = .red
        return healthVC
    }()

    func start() {
        rootViewController.setViewControllers([healthViewController], animated: false)
    }
}
