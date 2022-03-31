//
//  User.swift
//  redera
//
//  Created by Zayn on 3/23/22.
//

import Foundation
import FirebaseFirestoreSwift

//USER FETCHING OBJECT
struct User: Identifiable, Decodable, Equatable {
	@DocumentID var id: String?
	let username: String
	let fullname: String
	let profileImageUrl: String
	let email: String
}
