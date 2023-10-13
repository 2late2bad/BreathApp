//
//  MainCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit

final class MainCoordinator: Coordinator {

    private let router: Router
    var rootViewController: UITabBarController
    var childCoordinators: [Coordinator]
    var flowCompletionHandler: CoordinatorHandler?

    init(router: Router) {
        self.router = router
        childCoordinators = []
        rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .lightGray
        rootViewController.modalPresentationStyle = .fullScreen
        rootViewController.modalTransitionStyle = .flipHorizontal
    }

    func start() {
        let homeTabCoordinator = HomeTabCoordinator()
        homeTabCoordinator.start()
        self.childCoordinators.append(homeTabCoordinator)
        let homeViewController = homeTabCoordinator.rootViewController
        setup(controller: homeViewController, title: "Главная", imageName: "house", selectedImageName: "house.fill")

        let healthTabCoordinator = HealthTabCoordinator()
        healthTabCoordinator.start()
        self.childCoordinators.append(healthTabCoordinator)
        let healthViewController = healthTabCoordinator.rootViewController
        setup(controller: healthViewController, title: "Здоровье", imageName: "heart", selectedImageName: "heart.fill")

        let airTabCoordinator = AirTabCoordinator()
        airTabCoordinator.start()
        self.childCoordinators.append(airTabCoordinator)
        let airViewController = airTabCoordinator.rootViewController
        setup(controller: airViewController, title: "Воздух", imageName: "aqi.low", selectedImageName: "aqi.medium")

        let mapTabCoordinator = MapTabCoordinator()
        mapTabCoordinator.start()
        self.childCoordinators.append(mapTabCoordinator)
        let mapViewController = mapTabCoordinator.rootViewController
        setup(controller: mapViewController, title: "Карта", imageName: "map", selectedImageName: "map.fill")

        self.rootViewController.viewControllers = [
            homeViewController, healthViewController, airViewController, mapViewController
        ]

        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            // router.present(rootViewController, animated: !router.viewControllers.isEmpty)
            router.present(rootViewController, animated: true)
        }
    }

    func setup(controller: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let nonSelectedImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: nonSelectedImage, selectedImage: selectedImage)
        controller.tabBarItem = tabBarItem
    }
}
