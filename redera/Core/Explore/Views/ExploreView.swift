//
//  ExploreView.swift
//  redera
//
//  Created by Zayn on 3/19/22.
//

import SwiftUI
import Kingfisher

struct ExploreView: View {
	
	@ObservedObject var viewModal = ExploreViewModal()
	
	
	
	var body: some View {
		
		NavigationView {
			VStack {
				
				
				SearchBar(text: $viewModal.text)
				ScrollView {
					LazyVStack {
						ForEach(viewModal.searchUsers) { user in
							NavigationLink {
								ProfileView(user: user)
							} label: {
								UserRowView(user: user)
									.padding(.top, 10)
							}
							
						}
						
						
					}
				}
				
			}
			.navigationTitle("Find")
			
			
			
			
		}
	}
	
}



struct ExploreView_Previews: PreviewProvider {
	static var previews: some View {
		ExploreView()
		
	}
}
