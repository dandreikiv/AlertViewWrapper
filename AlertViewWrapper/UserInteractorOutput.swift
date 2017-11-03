//
//  UserInteractorOutput.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

/**
 The protocol defines number of methods which are accessible to Interactor 
 from Presenter. The Interactor delivers data to UI via Presenter by these 
 methods.
 */
protocol UserInteractorOutput: class {
	
	/**
	 The Interactor invokes this method after a user has been added to a storage.
	
	 - Parameter users: a list of users stored in data storage.
	 */
	func updateUserList(users:[User])
	
	
	/**
	 The method invokes to present an alert view with name of the user 
	 which has been added.
	
	 - Parameter user: the user which has been added.
	*/
	func presentAlertWith(user:User)
}
