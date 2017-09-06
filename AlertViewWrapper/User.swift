//
//  User.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

struct User: CustomStringConvertible {
	let firstName: String
	let lastName: String
	
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
	
	var description: String {
		get {
			return "\(firstName) \(lastName)"
		}
	}
}

struct RandomUser {
	
	private static let firstNames:[String] = ["John", "Mike", "Ron", "Anthony", "Nick"]
	private static let lastNames:[String]  = ["Dou", "Stone", "Long", "Great", "Last"]
	
	static func randomFirstName() -> String {
		let firstNameIdx = arc4random_uniform(UInt32(firstNames.count))
		return firstNames[Int(firstNameIdx)]
	}
	
	static func randomLastName() -> String {
		let lastNameIdx = arc4random_uniform(UInt32(lastNames.count))
		return lastNames[Int(lastNameIdx)]
	}
}

extension User {
	static func randomUser() -> User {
		return User(firstName: RandomUser.randomFirstName(), lastName: RandomUser.randomLastName())
	}
}
