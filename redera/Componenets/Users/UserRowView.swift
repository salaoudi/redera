//
//  UserRowView.swift
//  redera
//
//  Created by Zayn on 3/20/22.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
	
	let user: User
	
	
    var body: some View {
		VStack {
			HStack {
				KFImage(URL(string: user.profileImageUrl))
					.resizable()
					.clipShape(Circle())
					.scaledToFit()
					.frame(width: 50, height: 50)
				
				VStack(alignment: .leading, spacing: 2) {
					Text(user.username)
						.font(.subheadline).bold()
					
					Text(user.fullname)
						.font(.subheadline)
						.foregroundColor(Color.gray)
				}
				Spacer()
			}
			.padding(10)
			.background(Color.primary)
			.cornerRadius(13)
			.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
			.padding(.horizontal)
			.padding(.vertical, 5)
			
			
			
		}
    }
}
