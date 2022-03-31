//
//  AuthViewModal.swift
//  redera
//
//  Created by Zayn on 3/20/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModal: ObservableObject {
    //TO STORE USER SESSION THAT WATCHES IF A USER IS SIGNED IN, CREATED ACCOUNT, OR HAS SIGNED OUT.
    @Published var userSession: FirebaseAuth.User?
	// TO FECTH USERS AND DISPLAY INFO ON SCREEN
	@Published var currentUser: User?
	@Published var showuUerProfile = false
	//THIS SESSION MAKES SURE THAT USER DATA IS UPLOADED AND WAITS FOR THE PROFILE PICTUREE TO GET UPLOADED
	var secondarySession: FirebaseAuth.User?
	//THIS WILL WATCH WHEN USER AUTH IS FINISHED AND TAKES THEM AUTOMATICALLY TO THE HOME PAGE
	@Published var finishedAuth = false
	//THIS IS THE LOADER
	@Published var isLoading = false
	
	
	
	private var service = UserService()
    
    
    init() {
        self.userSession = Auth.auth().currentUser
		self.FetchUser()
    }
    
	//LOG IN //
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { Result, error in
            
            if let error = error {
                print("Error logging  back in\(error.localizedDescription)")
                return
            }
            
            guard let user = Result?.user else {return}
			self.userSession = user
			self.FetchUser()
            
        }
    }
    
	//REGISTER UPLOADE AND UPDATE
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
				print("Something is wromg\(error)")
                return
            }
            
            guard let user = result?.user else {return}
			self.isLoading = true
			self.secondarySession = user
			
            //UPDATE PROFILE DETAILS
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid
            ]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
					self.finishedAuth = true
                }
            
        }
    }
    
	
	//UPLOADING IMAGES FUNC HELPER
	func imageUploaderHelper(_ image: UIImage) {
		guard let uid = secondarySession?.uid else {return}
		ImageUploader.UploadImage(image: image) { profileImageUrl in
			Firestore.firestore().collection("users")
				.document(uid)
				.updateData(["profileImageUrl": profileImageUrl]) { _ in
					self.isLoading = true
					self.userSession = self.secondarySession
					self.FetchUser()
					
				}
			
		}
		
	}
	
	//FETCHING USER DATA
	func FetchUser() {
		guard let uid = self.userSession?.uid else {return}
		service.fetchUser(withUid: uid) { user in
			self.currentUser = user
		}
	}
	
	
	//LOGING USER OUT
    func logout() {
        userSession = nil
            try? Auth.auth().signOut()  
    }
    
}
