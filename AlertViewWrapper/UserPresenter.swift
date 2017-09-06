//
//  UserPresenter.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

class UserPresenter: UserModuleInterface, UserInteractorOutput {
	
	var userInteractor: UserInteractorInput?
	var userView: UserViewInterface?
	var alertWrapper: AlertWrapper?
	
	func createRandomUser() {
		userInteractor?.insert(user: User.randomUser())
	}
	
	func updateUserList(users: [User]) {
		userView?.reloadList(users: users)
	}
	
	func presentAlertWith(user: User) {
		
		let alert = AlertAction(title: "Close", action: nil)
		
		alertWrapper?.showAlert(
			title: "Title",
			message: "User (\(user.description)) has been added",
			actions: [alert.uiAlertAction(style: .default)],
			completion: nil
		)
	}
}
