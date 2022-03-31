//
//  rederaApp.swift
//  redera
//
//  Created by Zayn on 3/19/22.
//

import SwiftUI
import Firebase

@main
struct rederaApp: App {
    
    @StateObject var viewModal = AuthViewModal()
	
	init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
			ContentView()
                .environmentObject(viewModal)
        }
    }
}
