//
//  SceneDelegate.swift
//  CountryApp
//
//  Created by adityo.rancaka on 2023/04/21.
//

import Router
import UIKit
import Indonesia
import Japan

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let navigationController = UINavigationController()

        UIApplication.coordinator = AppCoordinator(
            navigationController: navigationController,
            navigator: worldNavigator
        )

        UIApplication.coordinator.goTo(.home)

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

func worldNavigator(_ destination: WorldDestination, navigationController: UINavigationController) {
    switch destination {
    case .home:
        let home = Home()
        navigationController.pushViewController(home, animated: true)
    case .indonesia(let destination):
        indonesiaNavigator(destination, navigationController: navigationController)
    case .japan(let destination):
        japanNavigator(destination, navigationController: navigationController)
    }
}
