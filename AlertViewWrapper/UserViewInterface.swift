//
//  UserViewInterface.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

/**
 The protocol defines number of methods by which Presenter communicates back
 to a view.
 */
protocol UserViewInterface {
	
	/**
	 Notifies a view that a list of users should be updated with given array 
	 of users.
	
	 - Parameter users: a list of users stored in data storage.
	 */
	func reloadList(users:[User])
}
