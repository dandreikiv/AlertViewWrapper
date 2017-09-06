//
//  UserModuleInterface.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

/**
 The protocol defines number of methods through which a view communicates 
 with an Interactor via Presenter.
 */
protocol UserModuleInterface {
	
	/**
	 Сreates a random user and passes it to Interactor
	 which stores the user to data storage.
	 */
	func createRandomUser()
}
