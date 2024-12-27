//
//  MoodEntry.swift
//  Weather-Data
//
//  Created by Guillaume Dochy on 03/12/2024.
//

import Foundation

/// Model representing a single mood entry.
/// Each entry consists of a date and an associated mood type.
struct MoodEntry {
    /// The date when the mood entry was recorded.
    var date: Date
    
    /// The type of mood associated with the entry, represented by a `MoodColor`.
    var mood: MoodColor
}
