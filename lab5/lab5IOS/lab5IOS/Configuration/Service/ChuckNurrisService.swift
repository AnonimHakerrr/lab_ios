//
//  ChuckNurrisService.swift
//  lab5IOS
//
//  Created by MacBook on 15.10.2025.
import Foundation

class ChuckNorrisService {
    func fetchRandomJoke() async throws -> Joke {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            throw NSError(domain: "InvalidURL", code: 1001, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let joke = try JSONDecoder().decode(Joke.self, from: data)
        return joke
    }
}
