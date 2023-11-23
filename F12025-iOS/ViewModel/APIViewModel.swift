//
//  APIViewModel.swift
//  F1 2025
//
//  Created by Florian DAVID on 04/11/2023.
//

import Foundation

enum StateAPI {
    case notAvailable
    case loading
    case success(data: Codable)
    case failed(error: Error)
}

@MainActor
class APIViewModel: ObservableObject {
    @Published var state: StateAPI = .notAvailable
    private let service: APIService

    init() {
        self.service = APIService()
    }
    
    func getAllCountries() async {
        self.state = .loading
        do {
            let countries = try await service.fetchCountries()
            self.state = .success(data: countries)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getAllPilots() async {
        self.state = .loading
        do {
            let pilots = try await service.fetchPilots()
            self.state = .success(data: pilots)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getAllTeams() async {
        self.state = .loading
        do {
            let teams = try await service.fetchTeams()
            self.state = .success(data: teams)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getAllGPs() async {
        self.state = .loading
        do {
            let gpS = try await service.fetchGPs()
            self.state = .success(data: gpS)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getAllCars() async {
        self.state = .loading
        do {
            let cars = try await service.fetchCars()
            self.state = .success(data: cars)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getAllPartners() async {
        self.state = .loading
        do {
            let partners = try await service.fetchPartners()
            self.state = .success(data: partners)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getPilotsFromTeam(team: Team) async {
        self.state = .loading
        do {
            let pilots = try await service.fetchPilots()
            let pilotsTeam = pilots.filter { $0.team.id_team == team.id_team }
            self.state = .success(data: pilotsTeam)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getCarByTeam(team: Team) async {
        self.state = .loading
        do {
            let cars = try await service.fetchCars()
            let carsTeam = cars.filter { $0.team.id_team == team.id_team }
            self.state = .success(data: carsTeam.first)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getResultsFromPilot(pilot: Pilot) async {
        self.state = .loading
        do {
            let results = try await service.fetchResultsForPilot(pilot: pilot)
            self.state = .success(data: results)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getCountryById(id: String) async {
        self.state = .loading
        do {
            let countries = try await service.fetchCountries()
            let country = countries.filter { $0.id_country == id }
            self.state = .success(data: country.first)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getPilotsStandingsFor(sprint: Bool) async {
        self.state = .loading
        do {
            let standings = try await service.fetchPilotStandingsFor(sprint: sprint)
            self.state = .success(data: standings)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
    
    func getTeamStandingsFor(sprint: Bool) async {
        self.state = .loading
        do {
            let standings = try await service.fetchTeamStandingsFor(sprint: sprint)
            self.state = .success(data: standings)
        } catch {
            self.state = .failed(error: error)
            print(error)
        }
    }
}
