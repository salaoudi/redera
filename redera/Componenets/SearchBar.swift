//
//  SearchBar.swift
//  redera
//
//  Created by Zayn on 3/24/22.
//

import SwiftUI

struct SearchBar: View {
	
	@Binding var text: String
	
    var body: some View {
		HStack {
			TextField("Search Users", text: $text)
				.padding(10)
				.padding(.leading, 20)
				.background(Color(.systemGray6))
				.cornerRadius(12)
				.overlay(
					HStack {
						Image(systemName: "magnifyingglass")
							.foregroundColor(Color.gray)
							.font(.system(size: 15))
							.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
							.padding(.leading, 10)
					}
				
				
				)
		}
		.padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
		SearchBar(text: .constant(""))
    }
}
