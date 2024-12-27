//
//  GoogleSearchItem.swift
//  Weather-Data
//
//  Created by Guillaume Dochy on 23/12/2024.
//

import Foundation

/// A decodable model representing a search result item from the Google Custom Search API.
/// Each item includes the title and URL link of the search result.
struct GoogleSearchItem: Decodable {
    /// The title of the search result.
    let title: String

    /// The URL link of the search result.
    let link: String
}
