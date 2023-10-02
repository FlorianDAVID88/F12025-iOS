//
//  Partenaire.swift
//  F12025-iOS
//
//  Created by user234243 on 9/27/23.
//

import Foundation

enum TypePartenaire: String, CaseIterable {
    case Mondial = "Partenaire mondial"
    case Officiel = "Partenaire officiel"
    case Régional = "Partenaire régional"
    case Fournisseur = "Fournisseur officiel"
}

struct Partenaire {
    var id_partenaire: UUID
    var nom_partenaire: String
    var descriptif: String
    var type: TypePartenaire
    var site: SiteWeb
    
    init(nom_partenaire: String, type: TypePartenaire, siteURL: String, siteURL_as: String) {
        self.id_partenaire = UUID()
        self.nom_partenaire = nom_partenaire
        self.descriptif = "\(nom_partenaire)_desc"
        self.type = type
        self.site = SiteWeb(nom_site: nom_partenaire, url: siteURL, url_as: siteURL_as)
    }
    
    static var allCases: [Partenaire] = [
        Partenaire(nom_partenaire: "188BET", type: .Régional, siteURL: "https://www.188bet.com/", siteURL_as: "188BET.com"),
        Partenaire(nom_partenaire: "AlphaTauri", type: .Fournisseur, siteURL: "https://alphatauri.com/", siteURL_as: "alphatauri.com"),
        Partenaire(nom_partenaire: "Aramco", type: .Mondial, siteURL: "https://www.aramco.com/", siteURL_as: "aramco.com"),
        Partenaire(nom_partenaire: "AWS", type: .Mondial, siteURL: "https://aws.amazon.com/f1/", siteURL_as: "aws.amazon.com"),
        Partenaire(nom_partenaire: "BBS", type: .Fournisseur, siteURL: "https://bbs-japan.co.jp/en/", siteURL_as: "BBS Japan Website"),
        Partenaire(nom_partenaire: "Crypto.com", type: .Mondial, siteURL: "https://crypto.com", siteURL_as: "crypto.com"),
        Partenaire(nom_partenaire: "DHL", type: .Mondial, siteURL: "https://inmotion.dhl/en/formula-1?utm_content=DHL-F1&utm_source=f1&utm_medium=website&utm_campaign=DHL-F1", siteURL_as: "dhl.com"),
        Partenaire(nom_partenaire: "Ferrari Trento", type: .Officiel, siteURL: "https://www.ferraritrento.com/en/", siteURL_as: "ferraritrento.com"),
        Partenaire(nom_partenaire: "Heineken", type: .Mondial, siteURL: "https://www.heineken.com", siteURL_as: "heineken.com"),
        Partenaire(nom_partenaire: "Lenovo", type: .Officiel, siteURL: "https://www.lenovo.com", siteURL_as: "lenovo.com"),
        Partenaire(nom_partenaire: "Liqui Moly", type: .Officiel, siteURL: "https://www.liqui-moly.com", siteURL_as: "liqui-moly.com"),
        Partenaire(nom_partenaire: "MSC Cruises", type: .Mondial, siteURL: "https://www.msccruises.com/int", siteURL_as: "www.msccruises.com"),
        Partenaire(nom_partenaire: "Paramount +", type: .Officiel, siteURL: "https://www.paramountplus.com", siteURL_as: "paramountplus.com"),
        Partenaire(nom_partenaire: "Pirelli", type: .Mondial, siteURL: "https://www.pirelli.com/tyres/en-ww/motorsport/f1/tyres?utm_source=formula1.com&utm_medium=referral&utm_campaign=ww_motorsport_f1&utm_content=globalpartners", siteURL_as: "Pirelli website"),
        Partenaire(nom_partenaire: "PUMA", type: .Fournisseur, siteURL: "https://go.puma.com/formula1-pp", siteURL_as: "puma.com"),
        Partenaire(nom_partenaire: "Qatar Airways", type: .Mondial, siteURL: "https://www.qatarairways.com", siteURL_as: "qatarairways.com"),
        Partenaire(nom_partenaire: "Rolex", type: .Mondial, siteURL: "https://www.rolex.com", siteURL_as: "rolex.com"),
        Partenaire(nom_partenaire: "Salesforce", type: .Mondial, siteURL: "https://www.salesforce.com/campaign/formula1/?d=7013y000002RO1gAAG&utm_source=formula1&utm_medium=referral&utm_campaign=us_c360aw&utm_content=formula1-salesforce-logo_7013y000002RO1gAAG", siteURL_as: "Salesforce.com"),
        Partenaire(nom_partenaire: "Tata Communications", type: .Fournisseur, siteURL: "https://www.tatacommunications.com/sports/powering-f1/", siteURL_as: "tatacommunications.com/sports/powering-f1/"),
        Partenaire(nom_partenaire: "Workday", type: .Régional, siteURL: "https://www.workday.com/", siteURL_as: "workday.com"),
    ]
}
