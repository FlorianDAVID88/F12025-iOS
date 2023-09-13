//
//  Circuit.swift
//  F12025-iOS
//
//  Created by user234243 on 9/13/23.
//

import Foundation

struct Circuit {
    var id_circuit = UUID()
    var nom: String
    var ville: String
    var pays: Pays
}

struct GrandPrix {
    var id_gp: UUID
    var nom: String
    var circuit: Circuit
    var dates: [String]
    var sprint: Bool        // true si c'est une semaine contenant une course sprint, false sinon
    var km_tour: Decimal
    var nb_tours: Int
    var virages: Int
    var zonesDRS: Int
    
    init(circuit: Circuit, date_debut: String, date_fin: String, sprint: Bool, km_tour: Decimal, nb_tours: Int, virages: Int, zonesDRS: Int, villeOrPays: Bool) {
        self.id_gp = UUID()
        self.nom = "Grand Prix de \(villeOrPays ? circuit.ville : circuit.pays.rawValue)"
        self.circuit = circuit
        self.dates = [ date_debut, date_fin ]
        self.sprint = sprint
        self.km_tour = km_tour
        self.nb_tours = nb_tours
        self.virages = virages
        self.zonesDRS = zonesDRS
    }

    
    static var allCases: [GrandPrix] = [
        GrandPrix(circuit: Circuit(nom: "Bahrain International Circuit", ville: "Sakhir", pays: .Bahrain), date_debut: "28/02", date_fin: "02/03", sprint: false, km_tour: 5.412, nb_tours: 57, virages: 15, zonesDRS: 3, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Jeddah Corniche Circuit", ville: "Jeddah", pays: .Arabie), date_debut: "07/03", date_fin: "09/03", sprint: false, km_tour: 6.174, nb_tours: 50, virages: 27, zonesDRS: 3, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Albert Park Circuit", ville: "Melbourne", pays: .Australie), date_debut: "21/03", date_fin: "23/03", sprint: false, km_tour: 5.278, nb_tours: 52, virages: 14, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Suzuka International Racing Course", ville: "Suzuka", pays: .Japon), date_debut: "04/04", date_fin: "06/04", sprint: false, km_tour: 5.807, nb_tours: 53, virages: 18, zonesDRS: 1, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Shanghai International Circuit", ville: "Shanghai", pays: .Chine), date_debut: "18/04", date_fin: "20/04", sprint: false, km_tour: 5.451, nb_tours: 56, virages: 16, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Circuit of the Americas", ville: "Austin", pays: .USA), date_debut: "02/05", date_fin: "04/05", sprint: true, km_tour: 5.513, nb_tours: 56, virages: 20, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Circuit Gilles-Villeneuve", ville: "Montréal", pays: .Canada), date_debut: "09/05", date_fin: "11/05", sprint: false, km_tour: 4.361, nb_tours: 70, virages: 14, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Circuit de Monaco", ville: "Monte-Carlo", pays: .Monaco), date_debut: "23/05", date_fin: "25/05", sprint: false, km_tour: 3.337, nb_tours: 78, virages: 19, zonesDRS: 1, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Circuit de Barcelona-Catalunya", ville: "Barcelone", pays: .Espagne), date_debut: "30/05", date_fin: "01/06", sprint: false, km_tour: 4.657, nb_tours: 66, virages: 14, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Circuit de Nevers-Magny-Cours", ville: "Magny-Cours", pays: .France), date_debut: "06/06", date_fin: "08/06", sprint: false, km_tour: 4.411, nb_tours: 70, virages: 17, zonesDRS: 3, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Red Bull Ring", ville: "Spielberg", pays: .Autriche), date_debut: "20/06", date_fin: "22/06", sprint: true, km_tour: 4.318, nb_tours: 71, virages: 10, zonesDRS: 3, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Silverstone Circuit", ville: "Silverstone", pays: .GB), date_debut: "27/06", date_fin: "29/06", sprint: false, km_tour: 5.891, nb_tours: 52, virages: 18, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Circuit de Spa-Francorchamp", ville: "Spa", pays: .Belgique), date_debut: "12/07", date_fin: "14/07", sprint: true, km_tour: 7.004, nb_tours: 44, virages: 19, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Kyalami Grand Prix Circuit", ville: "Sandton", pays: .AFS), date_debut: "26/07", date_fin: "28/07", sprint: false, km_tour: 4.281, nb_tours: 72, virages: 13, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Circuit Zandvoort", ville: "Zandvoort", pays: .PB), date_debut: "22/08", date_fin: "24/08", sprint: false, km_tour: 4.259, nb_tours: 72, virages: 14, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Autodromo Nazionale Monza", ville: "Monza", pays: .Italie), date_debut: "29/08", date_fin: "31/08", sprint: true, km_tour: 5.793, nb_tours: 53, virages: 11, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Sepang International Circuit", ville: "Sepang", pays: .Malaisie), date_debut: "12/09", date_fin: "14/09", sprint: false, km_tour: 5.543, nb_tours: 56, virages: 15, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Marina Bay Street Circuit", ville: "Singapour", pays: .Singapour), date_debut: "19/09", date_fin: "21/09", sprint: false, km_tour: 4.940, nb_tours: 62, virages: 19, zonesDRS: 3, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Autódromo Juan y Oscar Gálvez", ville: "Buenos Aires", pays: .Argentine), date_debut: "03/10", date_fin: "05/10", sprint: false, km_tour: 6.030, nb_tours: 42, virages: 18, zonesDRS: 3, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Autódromo Hermanos Rodríguez", ville: "Mexico City", pays: .Mexique), date_debut: "10/10", date_fin: "12/10", sprint: true, km_tour: 4.304, nb_tours: 71, virages: 17, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Las Vegas Circuit", ville: "Las Vegas", pays: .USA), date_debut: "24/10", date_fin: "26/10", sprint: false, km_tour: 6.120, nb_tours: 50, virages: 17, zonesDRS: 2, villeOrPays: true),
        GrandPrix(circuit: Circuit(nom: "Autódromo José Carlos Pace", ville: "São Paulo", pays: .Brésil), date_debut: "07/11", date_fin: "09/11", sprint: true, km_tour: 4.309, nb_tours: 71, virages: 15, zonesDRS: 2, villeOrPays: false),
        GrandPrix(circuit: Circuit(nom: "Yas Marina Circuit", ville: "Abu Dhabi", pays: .UAE), date_debut: "21/11", date_fin: "23/11", sprint: false, km_tour: 5.281, nb_tours: 58, virages: 16, zonesDRS: 2, villeOrPays: true),
    ]
}
