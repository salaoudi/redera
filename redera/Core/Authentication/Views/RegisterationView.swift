//
//  RegisterationView.swift
//  redera
//
//  Created by Zayn on 3/20/22.
//

import SwiftUI

struct RegisterationView: View {
	
	@State var username = ""
	@State var fullName = ""
	@State var email = ""
	@State var password = ""
	@State var errorMessage = ""
	
	@Environment(\.presentationMode) var present
	@EnvironmentObject var viewModal: AuthViewModal
	
	
	
	var body: some View {
		NavigationView {
		VStack {
			
			
			NavigationLink(destination: ProfileImagePickerView(), isActive: $viewModal.finishedAuth, label: { })
			
			
			
			VStack() {
				VStack {
					HStack {
						Text("red")
							.foregroundColor(Color.black)
							.font(.system(size: 80, weight: .regular, design: .rounded))
						Text("era")
							.foregroundColor(Color.pink)
							.font(.system(size: 80, weight: .thin, design: .rounded))
							.offset(x: -9)
					}
					Text("Create an account to get started")
						.foregroundColor(Color.gray)
						.font(.system(size: 20, weight: .regular, design: .rounded))
					

					VStack {
						if username.isEmpty {
							Text("Lets start with a great username")
						} else if fullName.isEmpty {
							Text("Next is your full name")
						} else if email.isEmpty {
							Text("Almost done, enter an email, and make sure its foramtted")
						} else if password.isEmpty {
							Text("Finally, make sure you pick a passowrd with 8 characters")
						} else {
							Image(systemName: "checkmark.circle")
								.foregroundColor(Color.green)
								.font(.system(size: 17))
						}
					}
					.font(.system(size: 12))
					.padding(10)
					.background(Color.white)
					.cornerRadius(12)
					.shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 0)
					.padding()
						
					
					

					
				}
				
				HStack {
					
					HStack(spacing: 15) {
						HStack {
							Image(systemName: "person.circle")
								.foregroundColor(Color.gray)
							TextField("Username", text: $username)
						}
						.padding()
						.background(Color.white)
						.cornerRadius(10)
						.shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 0)
						.padding(.vertical, 2)
						
						if username.isEmpty || fullName.isEmpty {
							RoundedRectangle(cornerRadius: 100, style: .continuous)
								.fill(Color.pink)
								.frame(width: 1, height: 50)
								
						} else {
							RoundedRectangle(cornerRadius: 100, style: .continuous)
								.fill(Color.green)
								.frame(width: 5, height: 50)
						}
						
						HStack {
							Image(systemName: "info.circle")
								.foregroundColor(Color.gray)
							TextField("Full Name", text: $fullName)
							
						}
						.padding()
						.background(Color.white)
						.cornerRadius(10)
						.shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 0)
						.padding(.vertical, 2)
					}
					
				}
				.padding(.vertical, 20)
				.padding(.horizontal, 30)
				.background(Color.white)
				.cornerRadius(15)
				.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
				.padding(.vertical)
				VStack {
					
					VStack(spacing: 15) {
						
						HStack {
							Image(systemName: "envelope.circle")
								.foregroundColor(Color.gray)
							TextField("Email", text: $email)
							
						}
						.padding()
						.background(Color.white)
						.cornerRadius(10)
						.shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 0)
						.padding(.vertical, 2)
						
						if email.isEmpty || password.isEmpty {
							RoundedRectangle(cornerRadius: 100, style: .continuous)
								.fill(Color.pink)
								.frame(width: 90, height: 1)
						} else {
							RoundedRectangle(cornerRadius: 100, style: .continuous)
								.fill(Color.green)
								.frame(width: 90, height: 5)
						}
						
						HStack {
							Image(systemName: "lock.circle")
								.foregroundColor(Color.gray)
							TextField("Password", text: $password)
							
						}
						.padding()
						.background(Color.white)
						.cornerRadius(10)
						.shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 0)
						.padding(.vertical, 2)
					}
					
				}
				.padding(.vertical, 30)
				.padding(.horizontal, 30)
				.background(Color.white)
				.cornerRadius(20)
				.shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
				Spacer()
				if viewModal.isLoading {
					VStack {
						LoaderView()
					}
				}
				
				
				Spacer()
				
				Button(action: {
					viewModal.register(withEmail: email, password: password, fullname: fullName, username: username)
					
				}){
					HStack {
						
						Text("Next")
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
				.disabled(viewModal.isLoading == true ? true : false)
				.opacity(viewModal.isLoading == true ? 0.5 : 1)
				
				
				
				
			}
			.padding(.vertical, 20)
			.padding(.horizontal)
			.padding(.top, 50)
			
			
		}
		.edgesIgnoringSafeArea(.all)
			
			
			
			
		.navigationBarHidden(true)
	}
	
	}
	
}

struct RegisterationView_Previews: PreviewProvider {
	static var previews: some View {
		RegisterationView()
			.environmentObject(AuthViewModal())
		
	}
}
