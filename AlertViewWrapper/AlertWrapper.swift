//
//  AlertWrapper.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

/**
 The protocol to which a view controller should conform, in order to be abot to 
 present an alert view via AlertWrapper.
 */
protocol AlertPresentable {
	
	/**
	 The method redirects an action of alert view creation and presentation to a
	 view controller.
	*/
	func showAlert(title: String?, message: String?, actions:[UIAlertAction], completion: (() -> Void)?)
}


/**
 The structure is a wrapper for an UIAlertView and is being used in the Presenter.
 As according to VIPER architecture the presenter should contain only plain objects 
 and shouldn't know anything about UI.
 */
struct AlertAction {
	let title: String?
	let action: (() -> Void)?
	
	init(title: String?, action: (()->Void)?) {
		self.title = title
		self.action = action
	}
}

extension AlertAction {
	func uiAlertAction(style: UIAlertActionStyle) -> UIAlertAction {
		return UIAlertAction(title: title, style: style, handler: { alertAction in
			self.action?()
		})
	}
}

class AlertWrapper {
	
	private let alertPresenter: AlertPresentable?
	
	init(controller: AlertPresentable?) {
		self.alertPresenter = controller
	}
	
	func showAlert(title: String?, message: String?, actions:[UIAlertAction], completion: (() -> Void)? ) {
		alertPresenter?.showAlert(title: title, message: message, actions: actions, completion: completion)
	}
}

