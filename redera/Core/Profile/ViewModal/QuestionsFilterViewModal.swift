//
//  QuestionsFilterViewModal.swift
//  redera
//
//  Created by Zayn on 3/19/22.
//

import SwiftUI

enum QuestionsFilterViewModal: Int, CaseIterable {
    case Posts
   
    
    var title: String {
        switch self {
        case .Posts: return "Posts"
        }
    }
}
