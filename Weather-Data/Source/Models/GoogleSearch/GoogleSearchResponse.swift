//
//  GoogleSearchResponse.swift
//  Weather-Data
//
//  Created by Guillaume Dochy on 23/12/2024.
//

import Foundation

/// A decodable model representing the response from the Google Custom Search API.
/// The response contains a collection of search result items.
struct GoogleSearchResponse: Decodable {
    /// An array of search result items returned by the API.
    let items: [GoogleSearchItem]
}
