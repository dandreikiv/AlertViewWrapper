//
//  ViewController.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UserViewInterface {
	
	private var presenter: UserModuleInterface
	private var list: [User]
	
	init(presenter: UserModuleInterface) {
		self.presenter = presenter
		self.list = []
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented");
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white

		createUI()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	private func createUI() {
		createAddUserButton()
	}
	
	private func createAddUserButton() {
		let addUser = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createUser))
		navigationItem.rightBarButtonItem = addUser;
	}
	
	@objc private func createUser() {
		presenter.createRandomUser()
	}
	
	func reloadList(users: [User]) {
		list = users
		// reload tableView... or any type of list representation...
	}
}

extension ViewController: AlertPresentable {
	
	func showAlert(title: String?, message: String?, actions: [UIAlertAction], completion: (() -> Void)?) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		for alertAction in actions {
			alert.addAction(alertAction)
		}
		present(alert, animated: true, completion: completion);
	}
}


