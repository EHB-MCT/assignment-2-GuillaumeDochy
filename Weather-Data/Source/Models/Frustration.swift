//
//  Frustration.swift
//  Weather-Data
//
//  Created by Guillaume Dochy on 10/12/2024.
//

import Foundation

/// Model representing a single frustration entry.
/// Each entry includes a topic, a description, and a timestamp.
struct Frustration {
    /// The topic associated with the frustration.
    var topic: String
    
    /// A detailed description of the frustration.
    var description: String
    
    /// The date and time when the frustration was recorded.
    var timestamp: Date
}
