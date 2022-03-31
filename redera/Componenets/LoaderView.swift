//
//  LoaderView.swift
//  redera
//
//  Created by Zayn on 3/23/22.

import SwiftUI

struct LoaderView: View {
    var body: some View {
		ZStack {
			Spacer()
			VStack {
				Spacer()
				ProgressView()
			}
				
		}
		.padding(90)
		.frame(width: 50, height: 50)
		.background(Color.white)
		.cornerRadius(15)
		.shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
		
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
