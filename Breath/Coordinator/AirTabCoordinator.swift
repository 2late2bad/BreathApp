//
//  AirTabCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit

final class AirTabCoordinator: Coordinator {

    var rootViewController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    init() {
        rootViewController = UINavigationController()
    }

    lazy var airViewController: UIViewController = {
        let airVC = UIViewController()
        airVC.title = "Air"
        airVC.view.backgroundColor = .green
        return airVC
    }()

    func start() {
        rootViewController.setViewControllers([airViewController], animated: false)
    }
}
