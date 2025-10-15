//
//  ChuckNorris.swift
//  lab5IOS
//
//  Created by MacBook on 15.10.2025.
//

import Foundation

struct Joke: Codable, Identifiable {
    let id: String
    let icon_url: String?
    let value: String
    
}
