//
//  HomeTabCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit

final class HomeTabCoordinator: Coordinator {

    var rootViewController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    init() {
        rootViewController = UINavigationController()
    }

    lazy var homeViewController: UIViewController = {
        let homeVC = HomeVC() // todo
        homeVC.title = "Home"
        homeVC.view.backgroundColor = .blue
        return homeVC
    }()

    func start() {
        rootViewController.setViewControllers([homeViewController], animated: false)
    }
}

// Проверка аутентификации
class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: .init(x: 100, y: 300, width: 200, height: 100))
        view.addSubview(button)
        button.setTitle("Out", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(outAuth), for: .touchUpInside)
    }

    @objc func outAuth() throws {
        AuthentificationManager.instance.signOut()
    }
}
