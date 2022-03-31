//
//  ExploreViewModal.swift
//  redera
//
//  Created by Zayn on 3/23/22.
//

import SwiftUI


class ExploreViewModal: ObservableObject {
	@Published var users = [User]()
	@Published var text = ""
	@Published var currentUser: User?
	@Published var showuUerProfile = false
	let service = UserService()
	
	var searchUsers: [User] {
		if text.isEmpty {
			return users
		} else {
			let caseQuery = text.lowercased()
			return users.filter({
				$0.username.contains(caseQuery) || $0.fullname.lowercased().contains(caseQuery)
			})
		}
	}
	
	init() {
		fetchUser()
	}
	
	
	func fetchUser() {
		service.fetchAllUsers { users in
			self.users = users
			print(users)
		}
	}
	
	
}
