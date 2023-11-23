//
//  APIService.swift
//  F1 2025
//
//  Created by Florian DAVID on 14/11/2023.
//

import Foundation

enum APIInfoError: Error {
    case apiKeyUndefined
    case failed
    case failToDecode
    case invalidStatusCode
    case invalidURL
}

struct APIService {
    func fetchCountries() async throws -> [Country] {
        return try await decodeAPIInfo(route: "countries", queryItems: [], to: [Country].self)
    }
    
    func fetchTeams() async throws -> [Team] {
        return try await decodeAPIInfo(route: "teams", queryItems: [], to: [Team].self)
    }
    
    func fetchPilots() async throws -> [Pilot] {
        return try await decodeAPIInfo(route: "pilots", queryItems: [], to: [Pilot].self)
    }
    
    func fetchCars() async throws -> [Car] {
        return try await decodeAPIInfo(route: "cars", queryItems: [], to: [Car].self)
    }
    
    func fetchGPs() async throws -> [GrandPrix] {
        return try await decodeAPIInfo(route: "GPs", queryItems: [], to: [GrandPrix].self)
    }
    
    func fetchPartners() async throws -> [Partner] {
        return try await decodeAPIInfo(route: "partners", queryItems: [], to: [Partner].self)
    }
    
    func fetchPilotStandingsFor(sprint: Bool) async throws -> [Pilot] {
        return try await decodeAPIInfo(route: "results/standings/pilots",
                                       queryItems: [URLQueryItem(name: "sprint", value: sprint.description)],
                                       to: [Pilot].self)
    }
    
    func fetchTeamStandingsFor(sprint: Bool) async throws -> [Team] {
        return try await decodeAPIInfo(route: "results/standings/teams",
                                       queryItems: [URLQueryItem(name: "sprint", value: sprint.description)],
                                       to: [Team].self)
    }
    
    func fetchResultsForPilot(pilot: Pilot) async throws -> [ResultCourse] {
        return try await decodeAPIInfo(route: "results/\(pilot.id_pilot)",
                                       queryItems: [],
                                       to: [ResultCourse].self)
    }
    
    
    /**
     * Returns the API key for this app
     * Creating in Product > Scheme > Edit Scheme > Run > Environment variables (create him if it doesn't)
     */
    private func getAPIKey() throws -> String {
        if let apiKey = ProcessInfo.processInfo.environment["API_KEY"] {
            return apiKey
        } else {
            throw APIInfoError.apiKeyUndefined
        }
    }
    
    /**
     * Returns the decoded data from the API
     * @param route: the route of the API
     * @param queryItems: the query items for the route
     * @param to: the type of the data to decode
     */
    private func decodeAPIInfo<T: Decodable>(route: String, queryItems: [URLQueryItem], to: T.Type) async throws -> T {
        let urlString = "https://f12025-api.vercel.app/\(route)"
        var queries = queryItems
        queries.append(URLQueryItem(name: "api_key", value: try getAPIKey()))
        
        if var urlComponents = URLComponents(string: urlString) {
            urlComponents.queryItems = queries
            
            if let url = urlComponents.url {
                let (data, resp) = try await URLSession.shared.data(from: url)
                
                guard let response = resp as? HTTPURLResponse, response.statusCode == 200 else {
                    throw APIInfoError.invalidStatusCode
                }
                
                let decodingData = try JSONDecoder().decode(T.self, from: data)
                return decodingData
            }
        }
        
        throw APIInfoError.invalidURL
    }
}
