//
//  UserInteractorInput.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

/**
 The protocol defines number of methods which should be implemented by object, 
 which behaves as interactor.
 */
protocol UserInteractorInput {
	
	/**
	 Stores given user into data storage, which is accessible via interactor.
	 
	 - Parameter user: the user.
	 */
	func insert(user: User)
}
