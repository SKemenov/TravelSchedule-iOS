//
//  SearchService.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 13.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias Searches = Components.Schemas.SearchObject

protocol SearchServiceProtocol {
    func getSearches(from: String, to: String) async throws -> Searches
}

final class SearchService: SearchServiceProtocol {
    private let client: Client

    init(client: Client) {
        self.client = client
    }

    func getSearches(from fromStation: String, to toStation: String) async throws -> Searches {
        let response = try await client.getSearches(query: .init(from: fromStation, to: toStation))
        return try response.ok.body.json
    }
}
