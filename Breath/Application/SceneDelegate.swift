//
//  SceneDelegate.swift
//  Breath
//
//  Created by Alexander V. on 29.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        startApp(window: window)
    }

    func startApp(window: UIWindow) {
        let coordinatorFactory: CoordinatorFactoryProtocol = CoordinatorFactory(
            authManager: AuthentificationManager.instance, moduleFactory: ModuleFactory()
        )
        let appCoordinator = coordinatorFactory.createAppCoordinator(window: window)
        self.appCoordinator = appCoordinator
        appCoordinator.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
