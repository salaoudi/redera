//
//  MainTabView.swift
//  redera
//
//  Created by Zayn on 3/19/22.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selected = 0
	
    var body: some View {
		ZStack {
			
			if selected == 0 {
				FeedView()
			} else if selected == 2 {
				ExploreView()
			} else {
				FeedView()
			}
				
				VStack {
					Spacer()
					TabButtons(selected: $selected)
						
				}
		}
		
		.edgesIgnoringSafeArea(.bottom)
    }
}



struct TabButtons: View {
    
    @Binding var selected: Int
    @State var addPost : Bool = false
    
    var body: some View {
        HStack {
            
            
            Button(action: {
                self.selected = 0
            }){
                Image(systemName: "safari")
					.font(.system(size: 16))
                    .foregroundColor(Color.pink.opacity(selected == 0 ? 1 : 0.5))
            }
			
			Spacer()
			Button(action: {
				self.selected = 1
				self.addPost = true
			}){
				Image(systemName: "plus.circle")
					.font(.system(size: 18))
					.padding(4)
					.foregroundColor(Color.white.opacity(selected == 1 ? 1 : 0.8))
					.background(Color.pink)
					.cornerRadius(10)
					.shadow(color: Color.pink.opacity(0.5), radius: 5, x: 0, y: 0)
			}
			.fullScreenCover(isPresented: $addPost) {
				NewPostView()
			}
			
            Spacer()
            Button(action: {
                self.selected = 2
            }){
                Image(systemName: "magnifyingglass")
					.font(.system(size: 16))
                    .foregroundColor(Color.pink.opacity(selected == 2 ? 1 : 0.5))
            }
            
            
            
        }
		.padding(.horizontal, 20)
		.padding(.vertical, 12)
		.background(Color.primary)
		.cornerRadius(19)
		.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
		.padding(.horizontal, 40)
		.padding(.bottom, 15)
		.padding(.horizontal, 40)
        
		
    }
		
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
		MainTabView()
			.environmentObject(AuthViewModal())
    }
}
