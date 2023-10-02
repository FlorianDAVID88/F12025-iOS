//
//  SiteWeb.swift
//  F12025-iOS
//
//  Created by user234243 on 9/29/23.
//

import Foundation

struct SiteWeb {
    var id_site: UUID
    var nom_site: String
    var url: String
    var url_as: String
    
    init(nom_site: String, url: String, url_as: String) {
        self.id_site = UUID()
        self.nom_site = nom_site
        self.url = url
        self.url_as = url_as
    }
}
