//
//  ContentView.swift
//  redera
//
//  Created by Zayn on 3/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModal: AuthViewModal
	
	
    var body: some View {
        VStack {
            if viewModal.userSession == nil {
                LoginView()
            } else {
				MainTabView()
            }
        }
    }
}
