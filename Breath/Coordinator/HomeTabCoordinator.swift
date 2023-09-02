//
//  HomeTabCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit

final class HomeTabCoordinator: Coordinator {

    var rootViewController: UINavigationController

    init() {
        rootViewController = UINavigationController()
    }

    lazy var homeViewController: UIViewController = {
        let homeVC = UIViewController()
        homeVC.title = "Home"
        homeVC.view.backgroundColor = .blue
        return homeVC
    }()

    func start() {
        rootViewController.setViewControllers([homeViewController], animated: false)
    }
}
