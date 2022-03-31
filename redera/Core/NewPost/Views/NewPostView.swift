//
//  NewPostView.swift
//  redera
//
//  Created by Zayn on 3/20/22.
//

import SwiftUI
import Kingfisher

struct NewPostView: View {
    
    @State var text = ""
    @Environment(\.presentationMode) var cancel
	@EnvironmentObject var viewModal: AuthViewModal
	@ObservedObject var postViewModal = PostViewModal()
	
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    cancel.wrappedValue.dismiss()
                }) {
					HStack {
						Image(systemName: "xmark.circle")
					}
					.foregroundColor(Color.white)
					.padding(.vertical, 6)
					.padding(.horizontal, 20)
					.background(Color.pink)
					.cornerRadius(12)
                        
                }
				Spacer()
				Text("New Post")
					.font(.system(size: 20, weight: .heavy, design: .rounded))
                Spacer()
                Button(action: {
					postViewModal.uploadPost(withCaption: text)
                }) {
					HStack {
						Image(systemName: "arrow.right.circle")
					}
					.foregroundColor(Color.white)
					.padding(.vertical, 6)
					.padding(.horizontal, 20)
					.background(Color.blue.opacity(0.9))
					.cornerRadius(12)
					.shadow(color: Color.blue.opacity(0.6), radius: 10, x: 0, y: 0)
                        
                }
            }
			.padding(.vertical)
            Divider()
            HStack(alignment: .top) {
                
				if let user = viewModal.currentUser {
					KFImage(URL(string: user.profileImageUrl))
						.resizable()
						.scaledToFill()
						.clipShape(Circle())
						.frame(width: 35, height: 35)
					TextArea("Add a new post", $text)
				}
                    
                
            }
            .padding()
            
            Spacer()
        }
		.onReceive(postViewModal.$uploadPost, perform: { success in
			if success {
				cancel.wrappedValue.dismiss()
			}
		})
        .padding()
        .edgesIgnoringSafeArea(.bottom)
    }
	
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
