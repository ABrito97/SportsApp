//
//  FootballTeamDetailModel.swift
//  SportsApp
//
//  Created by Alejandro Brito on 14/01/25.
//

import Foundation

struct FootballTeamDetailTable: Hashable, Codable  {
    var teams: [FootballTeamDetailModel]?
}

struct FootballTeamDetailModel: Hashable, Codable, Identifiable {
    var id: Int?
    var strTeam: String?
    var strTeamAlternate: String?
    var intFormedYear: String?
    var strSport: String?
    var strLeague: String?
    var strStadium: String?
    var intStadiumCapacity: String?
    var strCountry: String?
    var strDescriptionEN: String?
    var strLocation: String?
    var strBadge: String?
    var strFanart1: String?
}
