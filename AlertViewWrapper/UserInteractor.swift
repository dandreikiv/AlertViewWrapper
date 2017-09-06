//
//  UserInteractor.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

/**
 The Interactor is responsible for a use case implementation. 
 The current use case is simple user insertion.
 */
class UserInteractor: UserInteractorInput {
	
	/**
	 A reference to a presenter. Which is responsible for making connection
	 between data storage events, which can be implemented in interactor, and 
	 visual representation.
	 */
	var interactorOutput: UserInteractorOutput?
	
	// This is mocked user storage...
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

