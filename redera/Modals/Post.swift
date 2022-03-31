//
//  Post.swift
//  redera
//
//  Created by Zayn on 3/24/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
	@DocumentID var id: String?
	let caption: String
	let timestamp: Timestamp
	let uid: String
	var likes: Int
	
	var user: User?
	var liked: Bool? = false
	
	
}
