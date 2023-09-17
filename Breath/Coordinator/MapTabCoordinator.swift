//
//  MapTabCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit

final class MapTabCoordinator: Coordinator {

    var rootViewController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    init() {
        rootViewController = UINavigationController()
    }

    lazy var mapViewController: UIViewController = {
        let mapVC = UIViewController()
        mapVC.title = "MAP"
        mapVC.view.backgroundColor = .yellow
        return mapVC
    }()

    func start() {
        rootViewController.setViewControllers([mapViewController], animated: false)
    }
}
