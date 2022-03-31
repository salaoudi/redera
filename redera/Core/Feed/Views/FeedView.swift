//
//  FeedView.swift
//  redera
//
//  Created by Zayn on 3/19/22.
//

import SwiftUI
import Kingfisher

struct FeedView: View {
	
	@EnvironmentObject var viewModal: AuthViewModal
	@ObservedObject var feedViewModal = FeedViewModal()
	
	
	var body: some View {
		
		
		
		if let user = viewModal.currentUser {
			
			
			if feedViewModal.posts.isEmpty {
				LoaderView()
			} else {
				VStack {
					HStack {
						
						HStack {
							Text("REDERA")
								.font(.system(size: 25, weight: .bold, design: .rounded))
							RoundedRectangle(cornerRadius: 100)
								.fill(Color(.systemGray5))
								.frame(maxWidth: 1, maxHeight: 30)
								.padding(.horizontal, 5)
							Text("Feed")
								.font(.system(size: 25, weight: .thin, design: .rounded))
							Spacer()
						}
						
						Spacer()
						Button(
							action: {
								viewModal.showuUerProfile.toggle()
							}){
								HStack {
									Text("\(user.username)")
									KFImage(URL(string: user.profileImageUrl))
										.resizable()
										.scaledToFill()
										.clipShape(Circle())
										.frame(width: 16, height: 16)
									
								}
								.font(.system(size: 12))
								.foregroundColor(Color.primary)
								.padding(.horizontal, 7)
								.padding(.vertical, 7)
								.background(Color(.systemGray5))
								.cornerRadius(17)
								.shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
								.fullScreenCover(isPresented: $viewModal.showuUerProfile) {
									ProfileView(user: user)
								}
							}
					}
					.padding(.vertical, 5)
					.padding(.horizontal)
					RoundedRectangle(cornerRadius: 100)
						.fill(Color(.systemGray6))
						.frame(maxWidth: .infinity, maxHeight: 1)
						.padding(.horizontal)
					
					ScrollView() {
						
							LazyVStack {
								
									ForEach (feedViewModal.posts) { post in
										QuestionRowView(post: post)
									}
								
							}
							.padding(.bottom, 0)
							
						}
					.offset(y: -8)
					}
			}
			
			
				
			
		}
		}
	}
	
	struct FeedView_Previews: PreviewProvider {
		static var previews: some View {
			FeedView()
				.environmentObject(AuthViewModal())
		}
	}

