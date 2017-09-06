//
//  AppDelegate.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds);

		let interactor = UserInteractor()
		let presenter = UserPresenter()
		
		let viewController = ViewController(presenter: presenter)
		
		presenter.userInteractor = interactor
		presenter.userView = viewController
		presenter.alertWrapper = AlertWrapper(controller: viewController)
		
		interactor.interactorOutput = presenter
		
		window?.rootViewController = UINavigationController(rootViewController: viewController)
		window?.makeKeyAndVisible();
		
		return true
	}
}

