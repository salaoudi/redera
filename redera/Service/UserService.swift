//
//  UserService.swift
//  redera
//
//  Created by Zayn on 3/23/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
//FETCHING USER OBJECT FORMAT
struct UserService {
	func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
		Firestore.firestore().collection("users")
			.document(uid)
			.getDocument { snapshot, _ in
				guard let snapshot = snapshot else {return}
				
				guard let user = try? snapshot.data(as: User.self) else {return}
				completion(user)
				
			}
	}
	
	func fetchAllUsers(completion: @escaping([User]) -> Void ) {
		
		Firestore.firestore().collection("users")
			.getDocuments { snapshot, _ in
			guard let documents = snapshot?.documents else {return}
				let users = documents.compactMap({try? $0.data(as: User.self)})
				completion(users)
		}
	}
	
}
