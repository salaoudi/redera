//
//  ProfileViewModal.swift
//  redera
//
//  Created by Zayn on 3/24/22.
//

import Foundation

class ProfileViewModal: ObservableObject {
	@Published var posts = [Post]()
	private let service = PostService()
	var user: User
	
	init(user: User) {
		self.user = user
		self.fetchUserPosts()
	}
	
	func fetchUserPosts() {
		guard let uid = user.id else {return}
		service.fetchPosts(forUid: uid) { posts in
			self.posts = posts
			
			for i in 0 ..< posts.count {
				self.posts[i].user = self.user
			}
			
		}
	}
	
	
}
