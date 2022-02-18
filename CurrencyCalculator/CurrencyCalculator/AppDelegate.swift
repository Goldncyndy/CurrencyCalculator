//
//  AppDelegate.swift
//  CurrencyCalculator
//
//  Created by Decagon on 26/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
      guard let windowScene = (scene as? UIWindowScene) else { return }
      
      let rootViewCOntroller = DashboardViewController()
      
      let navigationController = UINavigationController(rootViewController: rootViewCOntroller)
      
      window = UIWindow(frame: windowScene.coordinateSpace.bounds)
      window?.windowScene = windowScene
      window?.rootViewController = navigationController
      window?.makeKeyAndVisible()
  }


}

