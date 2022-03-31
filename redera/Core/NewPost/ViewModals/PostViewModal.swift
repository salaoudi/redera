//
//  PostViewMOdal.swift
//  redera
//
//  Created by Zayn on 3/24/22.
//

import Foundation
import Firebase
import FirebaseAuth
import UIKit

class PostViewModal: ObservableObject {
	let service = PostService()
	private var userService = UserService()
	@Published var uploadPost = false
	@Published var userSession: FirebaseAuth.User?
	// TO FECTH USERS AND DISPLAY INFO ON SCREEN
	@Published var currentUser: User?
	
	func uploadPost(withCaption caption: String) {
		service.newPost(caption: caption) { success in
			if success {
				self.uploadPost = true
			} else {
				
			}
		}
	}
	
	
	
	
	
}
