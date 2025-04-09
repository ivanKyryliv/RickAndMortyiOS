//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Ivan on 09.04.2025.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case locaton
    /// Endpoint to get episode info
    case episode
}
