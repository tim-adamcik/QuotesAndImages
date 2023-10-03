//
//  RandomImage.swift
//  QuotesAndImages
//
//  Created by Timothy Adamcik on 10/3/23.
//

import Foundation

struct RandomImage: Decodable {
    let image: Data
    let quote: Quote
}

struct Quote: Decodable {
    let content: String
}
