//
//  QuestionRowView.swift
//  redera
//
//  Created by Zayn on 3/19/22.
//

import SwiftUI
import Kingfisher

struct QuestionRowView: View {
	
	let post: Post
	
	
	var body: some View {
		
		VStack(alignment: .leading) {
			if let users = post.user {
				HStack(alignment: .top, spacing: 10) {
					KFImage(URL(string: users.profileImageUrl))
						.resizable()
						.scaledToFill()
						.clipShape(Circle())
						.frame(width: 30, height: 30)
						.foregroundColor(Color(.systemRed))
					
					VStack(alignment: .leading, spacing: 3) {
						
						HStack(alignment: .top) {
							Text(users.fullname)
								.font(.subheadline).bold()
							Text("@\(users.username)")
								.font(.caption)
							Text("")
								.font(.caption)
								.foregroundColor(Color.pink)
						}
						.padding(.vertical, 8)
						
						
						Text(post.caption)
							.font(.subheadline)
							.multilineTextAlignment(.leading)
					}
					
					Spacer()
					
					
				}
				.frame(maxWidth: .infinity)
			}

			
		}
		.padding()
		.frame(maxWidth: .infinity)
		.background(Color(.systemGray6))
		.cornerRadius(20)
		.padding(.horizontal)
		.padding(.top, 15)
		
		
		
	}
}
