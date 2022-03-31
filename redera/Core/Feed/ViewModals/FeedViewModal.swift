//
//  FeedViewModal.swift
//  redera
//
//  Created by Zayn on 3/24/22.
//

import Foundation

class FeedViewModal: ObservableObject {
	let service = PostService()
	@Published var posts = [Post]()
	let userService = UserService()
	
	
	
	init() {
		fetchPosts()
		
	}
	
	func fetchPosts() {
		
		service.fetchPosts { posts in
			self.posts = posts
			for i in 0 ..< posts.count {
				let uid = posts[i].uid
				self.userService.fetchUser(withUid: uid) { user in
					self.posts[i].user = user
				}
				
			}
			
		}
		
	}
	
}

