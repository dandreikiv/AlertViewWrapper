//
//  ViewController.swift
//  AlertViewWrapper
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UserViewInterface, UITableViewDataSource, UITableViewDelegate {
	
	private let cellIndentifier = "UserCellIdentifier"
	
	private var presenter: UserModuleInterface
	private var list: [User]
	private var tableView: UITableView
	
	init(presenter: UserModuleInterface) {
		self.presenter = presenter
		self.list = []
		self.tableView = UITableView()
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented");
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(tableView)
		createUI()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	private func createUI() {
		createAddUserButton()
		configureTableView()
	}
	
	private func createAddUserButton() {
		let addUser = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createUser))
		navigationItem.rightBarButtonItem = addUser;
	}
	
	private func configureTableView() {
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		tableView.dataSource = self
		tableView.delegate = self
	}
	
	@objc private func createUser() {
		presenter.createRandomUser()
	}
	
	func reloadList(users: [User]) {
		list = users
		
		// reload tableView... or any type of list representation...
		tableView.reloadData()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return list.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier) else {
			return UITableViewCell(style: .default, reuseIdentifier: cellIndentifier)
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		cell.textLabel?.text = list[indexPath.row].description
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


