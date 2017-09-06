//
//  AlertWrapper.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

protocol AlertPresentable {
	func showAlert(title: String?, message: String?, actions:[UIAlertAction], completion: (() -> Void)? );
}

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
		});
	}
}

final class AlertWrapper {
	
	private let alertPresenter: AlertPresentable?
	
	init(controller: AlertPresentable?) {
		self.alertPresenter = controller;
	}
	
	func showAlert(title: String?, message: String?, actions:[UIAlertAction], completion: (() -> Void)? ) {
		alertPresenter?.showAlert(title: title, message: message, actions: actions, completion: completion);
	}
}

