//
//  MoodColor.swift
//  Weather-Data
//
//  Created by Guillaume Dochy on 03/12/2024.
//

import SwiftUI

/// Enum representing different moods, each associated with a specific color.
enum MoodColor: String {
    /// Represents a happy mood with an associated green color.
    case happy
    
    /// Represents a sad mood with an associated blue color.
    case sad
    
    /// Represents a neutral mood with an associated gray color.
    case neutral
    
    /// A computed property that returns the `Color` associated with each mood.
    var color: Color {
        switch self {
        case .happy:
            return .green
        case .sad:
            return .blue
        case .neutral:
            return .gray
        }
    }
}
