//
//  AppRouter.swift
//  Breath
//
//  Created by Alexander V. on 13.10.2023.
//

import UIKit

final class AppRouter: NSObject, Router {

    private var completions: [UIViewController: () -> Void]

    public var rootViewContoller: UIViewController? {
        navigationController.viewControllers.first
    }

    public unowned let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.completions = [:]
        super.init()
    }

    public func toShowable() -> UIViewController {
        navigationController
    }

    func present(_ module: Showable, animated: Bool) {
        navigationController.present(module.toShowable(), animated: animated, completion: nil)
    }

    func push(_ module: Showable, animated: Bool, completion: (() -> Void)?) {
        let controller = module.toShowable()

        guard controller is UINavigationController == false else {
            return
        }

        if let completion {
            completions[controller] = completion
        }

        navigationController.pushViewController(controller, animated: animated)
    }

    func pop(animated: Bool) {
        if let controller = navigationController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    fileprivate func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}
