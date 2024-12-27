//
//  Article.swift
//  Weather-Data
//
//  Created by Guillaume Dochy on 23/12/2024.
//

import Foundation

/// A model that represents an article returned by the Google Custom Search API.
/// Each article contains a unique identifier, title, and link.
struct Article: Identifiable {
    /// A unique identifier for the article.
    let id = UUID()

    /// The title of the article.
    let title: String

    /// The URL link to the article.
    let link: String
}
