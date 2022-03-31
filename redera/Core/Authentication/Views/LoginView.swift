//
//  LoginView.swift
//  redera
//
//  Created by Zayn on 3/20/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var singupComplete = false
    
    @EnvironmentObject var viewModal: AuthViewModal
    
    var body: some View {
        NavigationView {
            VStack {
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
					Text("Welcome back")
						.foregroundColor(Color.gray)
						.font(.system(size: 20, weight: .regular, design: .rounded))
					
				}
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    .padding(.vertical, 20)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    .padding(.vertical, -2)
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }){
                        Text("Forgot Password?")
                }
                }
                
                
                Button(action: {
                    viewModal.login(withEmail: email, password: password)
                }){
					HStack {
						
						Text("Sign in")
						Image(systemName: "arrow.right")
					}
					.padding()
					.foregroundColor(Color.white)
					.background(Color.pink)
				.cornerRadius(10)
					
                }
                
                Spacer()
                
                Button(action: {
                    singupComplete = true
                }){
                    Text("Don't have an account, CREATE ONE")
                }
                
            }
            .padding()
            .sheet(isPresented: $singupComplete) {
                RegisterationView()
            }
			.navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
