//
//  UserInteractor.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

class UserInteractor: UserInteractorInput {
	
	var interactorOutput: UserInteractorOutput?
	
	// This mockes user storage...
	var users: [User]
	
	init() {
		users = []
	}
	
	func insert(user: User) {
		users.append(user)
		
		interactorOutput?.updateUserList(users: users)
		interactorOutput?.presentAlertWith(user:user)
	}
}

