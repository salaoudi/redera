//
//  ProfileView.swift
//  redera
//
//  Created by Zayn on 3/19/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
	
	@State private var filter: QuestionsFilterViewModal = .Posts
	@ObservedObject var profileViewModal: ProfileViewModal
	@EnvironmentObject var viewModal: AuthViewModal
	@Environment(\.presentationMode) var present
	@Namespace var animation
	
	
	
	init(user: User) {
		self.profileViewModal = ProfileViewModal(user: user)
	}
	
	var body: some View {
		
		VStack {
			headerView
			updateProfile
			questionsFilterView
			questionsRowView
			
			Spacer()
			
			
		}
		.edgesIgnoringSafeArea(.all)
		.navigationBarHidden(true)
	}
	
}

struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileView(user: User(username: "SALEH", fullname: "ALAOUDI", profileImageUrl: "http", email: "s@s.com"))
	}
}


extension ProfileView {
	
	var headerView: some View {
		VStack(alignment: .center) {
			VStack {
				HStack {
					
					Button(action: {
						present.wrappedValue.dismiss()
					}){
						Image(systemName: "arrow.left")
							.padding(5)
							.foregroundColor(Color.primary)
					}
					Spacer()
					if viewModal.currentUser == profileViewModal.user {
						VStack {
							Button(action: {
								viewModal.logout()
							}){
								HStack {
									Text("Logout")
										.foregroundColor(Color.pink)
									Image(systemName: "power")
										.padding(5)
										.foregroundColor(Color.pink)
										.background(Color.white)
										.cornerRadius(100)
								}
							}
						}
					} else {
						Text("")
					}
					
					
				}
				
			}
			.padding(.horizontal)
			.padding(.top, 40)
			
			ZStack {
				ZStack {
					Circle()
						.fill(Color.pink)
						.zIndex(-100)
						.frame(width: 80, height: 80)
						.offset(y: 30)
				}
				ZStack {
					Circle()
						.fill(Color.blue)
						.zIndex(-200)
						.frame(width: 80, height: 80)
						.offset(x: 10, y: 60)
				}
				ZStack {
					Circle()
						.fill(Color.yellow)
						.zIndex(-200)
						.frame(width: 80, height: 80)
						.offset(x: -10, y: 60)
				}
				KFImage(URL(string: profileViewModal.user.profileImageUrl))
					.resizable()
					.scaledToFit()
					.clipShape(Circle())
					.frame(width: 130, height: 130)
					.offset(y: 50)
					.shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 0)
					.zIndex(100)
				
			}
			.offset(y: -30)
			
			
			
		}
		
		
		
	}
	
	var updateProfile: some View {
		VStack {
			VStack {
				Text(profileViewModal.user.fullname)
					.fontWeight(.bold)
				Text("@\(profileViewModal.user.username)")
			}
			.foregroundColor(Color.secondary)
			.padding(.vertical, 12)
			.padding(.horizontal, 10)
			.cornerRadius(16)
			.padding(.top, -6)
			
			HStack {
				
				Button(action: {
					
				}){
					Text("Update Profile")
						.font(.subheadline)
						.foregroundColor(Color.black)
						.frame(width: 120, height: 20)
						.padding(5)
						.background(Color(.systemGray6))
						.cornerRadius(9)
				}
			}
			.padding(.horizontal)
			.padding(.top, -5)
			.font(.system(size: 16))
		}
		
	}
	
	var questionsFilterView: some View {
		
		HStack {
			ForEach(QuestionsFilterViewModal.allCases, id: \.rawValue) { items in
				VStack {
					
					Text(items.title)
						.font(.subheadline)
						.fontWeight(filter == items ? .semibold : .regular)
					
					
					
					if filter == items {
						Capsule()
							.foregroundColor(.pink)
							.frame(height: 3)
							.matchedGeometryEffect(id: "animated", in: animation)
							.offset(y: 6)
					} else {
						Capsule()
							.foregroundColor(.clear)
							.frame(height: 3)
					}
				}
				.onTapGesture {
					withAnimation(.easeInOut) {
						self.filter = items
					}
					
				}
			}
			
		}
		.foregroundColor(.pink)
		.padding(5)
		.background(Color.primary)
		.cornerRadius(20)
		.shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 0)
		.padding(.vertical, 5)
		.padding(.horizontal)
		
		
		
	}
	
	var questionsRowView: some View {
		ScrollView() {
			LazyVStack {
				ForEach(profileViewModal.posts)  { post in
					QuestionRowView(post: post)
				}
			}
			.padding(.top, 15)
			
		}
		.offset(y: -13)
		
	}
	
	
	
}


