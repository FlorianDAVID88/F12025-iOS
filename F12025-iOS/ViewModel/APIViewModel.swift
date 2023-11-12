//
//  APIViewModel.swift
//  F1 2025
//
//  Created by Florian DAVID on 04/11/2023.
//

import Foundation

class APIViewModel: ObservableObject {
    @Published var teams: [Team] = []
    @Published var pilots: [Pilot] = []
    @Published var cars: [Car] = []
    @Published var allGPs: [GrandPrix] = []
    @Published var partners: [Partner] = []
    @Published var countries: [Country] = []
    
    
    init() {
        initData()
    }
    
    private func initData() {
        Task.init {
            do {
                let teams = try await decodeAPIInfo(route: "teams", queryItems: [], to: [Team].self)
                let pilots = try await decodeAPIInfo(route: "pilots", queryItems: [], to: [Pilot].self)
                let cars = try await decodeAPIInfo(route: "cars", queryItems: [], to: [Car].self)
                let allGPs = try await decodeAPIInfo(route: "GPs", queryItems: [], to: [GrandPrix].self)
                let partners = try await decodeAPIInfo(route: "partners", queryItems: [], to: [Partner].self)
                let countries = try await decodeAPIInfo(route: "countries", queryItems: [], to: [Country].self)
                
                DispatchQueue.main.async {
                    self.teams.append(contentsOf: teams)
                    self.pilots.append(contentsOf: pilots)
                    self.cars.append(contentsOf: cars)
                    self.allGPs.append(contentsOf: allGPs)
                    self.partners.append(contentsOf: partners)
                    self.countries.append(contentsOf: countries)
                }
                
            } catch {
                throw APIError.runtimeError("Error : \(error)")
            }
        }
    }
    
    /**
     * Returns the API key for this app
     * Creating in Product > Scheme > Edit Scheme > Run > Environment variables (create him if it doesn't)
     */
    private func getAPIKey() throws -> String {
        if let apiKey = ProcessInfo.processInfo.environment["API_KEY"] {
            return apiKey
        } else {
            throw APIError.apiKeyError("The environment variable 'API_KEY' wasn't defined.")
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
                let (data, _) = try await URLSession.shared.data(from: url)
                
                do {
                    let dataDecoded = try JSONDecoder().decode(to, from: data)
                    return dataDecoded
                } catch {
                    throw APIError.runtimeError("\(route) error : \(error)")
                }
            }
        }
        
        throw APIError.runtimeError("No data found !")
    }
    
    func getResultsFromPilot(pilot: Pilot) async -> [ResultCourse] {
        do {
            let res = try await decodeAPIInfo(route: "results/\(pilot.id_pilot)",
                                              queryItems: [],
                                              to: [ResultCourse].self)
            return res
        } catch {
            print("Error results : \(error)")
            return []
        }
    }
    
    func getPilotsStandingsFor(sprint: Bool) -> [Pilot] {
        Task.init {
            do {
                let clt = try await decodeAPIInfo(route: "results/standings/pilots",
                                                  queryItems: [URLQueryItem(name: "sprint", value: sprint.description)],
                                                  to: [Pilot].self)
                return clt
            } catch {
                print("Error pilot standings : \(error)")
                return []
            }
        }
        return []
    }
    
    func getTeamStandingsFor(sprint: Bool) -> [Team] {
        Task.init {
            do {
                return try await decodeAPIInfo(route: "results/standings/teams",
                                               queryItems: [URLQueryItem(name: "sprint", value: sprint.description)],
                                               to: [Team].self)
            } catch {
                print("Error team standings : \(error)")
                return []
            }
        }
        return []
    }
    
    func getCarByTeam(team: Team) -> Car? {
        return self.cars.first(where: { $0.team.id_team == team.id_team })
    }
    
    func getCountryById(id: String) -> Country? {
        Task.init {
            do {
                let countries = try await decodeAPIInfo(route: "teams/\(id)",
                                                        queryItems: [],
                                                        to: [Country]?.self)
                return countries?.first
            } catch {
                print("Error country : \(error)")
                return nil
            }
        }
        return nil
    }
    
    func getPilotsFromTeam(team: Team) -> [Pilot] {
        return self.pilots.filter({ $0.team.id_team == team.id_team })
    }
    
    enum APIError: Error {
        case apiKeyError(String)
        case runtimeError(String)
    }
}
