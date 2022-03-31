//
//  ProfileImagePickerView.swift
//  redera
//
//  Created by Zayn on 3/22/22.
//

import SwiftUI

struct ProfileImagePickerView: View {
	@State var selectedImage: UIImage?
	@State var profileImage: Image?
	@EnvironmentObject var viewModal: AuthViewModal
	@State var showPicker = false
	var body: some View {
		VStack {
			
			HStack {
				
				Text("Add a profile photo to continue")
					.font(.system(size: 40, weight: .bold, design: .rounded))
				Spacer()
			}
			
			HStack {
				Button(action: {
					showPicker.toggle()
				}){
					if let profileImage = profileImage {
						profileImage
							.resizable()
							.font(.system(size: 190))
							.frame(width: 100, height: 100)
							.cornerRadius(100)
							.foregroundColor(Color.pink)
							.font(.system(size: 90))
					} else {
						Image(systemName: "person.crop.circle.badge.plus")
							.foregroundColor(Color.pink)
							.font(.system(size: 150))
					}
				}
				.padding(2)
				.sheet(isPresented: $showPicker, onDismiss: loadProfileImageAfterUserSelection) {
					ImagePicker(selectedPic: $selectedImage)
				}
				
				
			}
			Spacer()
			
			if let selectedImage = selectedImage {
				Button(action: {
					viewModal.imageUploaderHelper(selectedImage)
				}){
					HStack {
						
						Text("Done")
						Image(systemName: "arrow.right")
					}
					.padding()
				}
				.padding(4)
				.foregroundColor(Color.white)
				.background(Color.pink)
				.cornerRadius(22)
				.shadow(color: Color.pink.opacity(0.5), radius: 20, x: 0, y: 0)
				.padding()
			}
			
		}
		.padding()
	}
	
	func loadProfileImageAfterUserSelection() {
		guard let selectedImage = selectedImage else {return}
		profileImage = Image(uiImage: selectedImage)
	}
	
}

struct ProfileImagePickerView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileImagePickerView()
	}
}
