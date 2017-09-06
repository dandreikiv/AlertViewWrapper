//
//  AlertViewWrapperTests.swift
//  AlertViewWrapperTests
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import XCTest
@testable import AlertViewWrapper

class StubController: AlertPresentable {
	
	var title: String?
	var message: String?
	var actions: [UIAlertAction]?
	var showAlertHasbeenCalled = false
	
	func showAlert(title: String?, message: String?, actions: [UIAlertAction], completion: (() -> Void)?) {
		self.title = title
		self.message = message
		self.actions = actions
		showAlertHasbeenCalled = true
	}
}

class AlertViewWrapperTests: XCTestCase {
	
	var alertWrapper: AlertWrapper?
	var alertPresenter: StubController?
    
    override func setUp() {
        super.setUp()
		
		alertPresenter = StubController()
		alertWrapper = AlertWrapper(controller: alertPresenter)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
		
		alertWrapper = nil
		alertPresenter = nil
    }
    
	func testAlertPresentedCorrectTitle() {
		let title = "Title"
		alertWrapper?.showAlert(title: title, message: nil, actions: [UIAlertAction](), completion: nil)
		
		XCTAssertEqual(title, alertPresenter?.title)
	}
	
	func testAlertPresentedCorrectMessage() {
		let message = "Message"
		alertWrapper?.showAlert(title: nil, message: message, actions: [UIAlertAction](), completion: nil)
		
		XCTAssertEqual(message, alertPresenter?.message)
	}
	
	func testAlertPresentedWithCorrectActions() {
		
		let action1 = UIAlertAction(title: "Action1", style: .default, handler: nil)
		let action2 = UIAlertAction(title: "Action2", style: .default, handler: nil)
		
		let actions = [action1, action2]
		
		alertWrapper?.showAlert(title: nil, message: nil, actions: actions, completion: nil)
		
		for action in (alertPresenter?.actions)! {
			XCTAssertTrue(actions.contains(action))
		}
	}
	
	func testAlertHasBeenPresented() {
		alertWrapper?.showAlert(title: nil, message: nil, actions: [UIAlertAction](), completion: nil)
		XCTAssertEqual(true, alertPresenter?.showAlertHasbeenCalled)
	}
}
