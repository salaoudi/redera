//
//  PostService.swift
//  redera
//
//  Created by Zayn on 3/24/22.
//

import Firebase


struct PostService {
	func newPost(caption: String, completion: @escaping(Bool) -> Void) {
		guard let uid = Auth.auth().currentUser?.uid else {return}
		
		let data = ["uid": uid, "caption": caption, "likes": 0, "timestamp": Timestamp(date: Date())] as [String : Any]
		
		Firestore.firestore().collection("posts")
			.document().setData(data) { error in
				if let error = error {
					print("FAILED TO UPLAOD POST \(error.localizedDescription)")
					completion(false)
					return
				} else {
					completion(true)
				}
			}
	}
	//FETCHING POSTS ORDER
	func fetchPosts(completion: @escaping([Post]) -> Void) {
		Firestore.firestore().collection("posts")
			.order(by: "timestamp", descending: true)
			.getDocuments { snapshot, _ in
				guard let documents = snapshot?.documents else {return}
				documents.forEach { docs in
					
					let posts = documents.compactMap({try? $0.data(as: Post.self)})
					completion(posts)
				}
			}
	}
	
	//FETCH USER OWN POSTS ON PROFILE
	func fetchPosts(forUid uid: String, completion: @escaping([Post]) -> Void) {
		Firestore.firestore().collection("posts")
			.whereField("uid", isEqualTo: uid)
			.getDocuments { snapshot, _ in
				guard let documents = snapshot?.documents else {return}
				documents.forEach { docs in
					let posts = documents.compactMap({try? $0.data(as: Post.self)})
					completion(posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
				}
			}
	}
	
	
	
	
	
}
