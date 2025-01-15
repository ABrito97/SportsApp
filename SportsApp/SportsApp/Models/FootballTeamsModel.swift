//
//  FootballTeamsModel.swift
//  SportsApp
//
//  Created by Alejandro Brito on 13/01/25.
//

import Foundation

struct FootballListTable: Hashable, Codable {
    var table: [FootballTeamsModel]?
}

struct FootballTeamsModel: Hashable, Codable, Identifiable {
    var intRank: String?
    var strTeam: String?
    var intPoints: String?
    var intWin: String?
    var intLoss: String?
    var intDraw: String?
    var strBadge: String?
    
    var id: Int {
        if let intRank = intRank { return Int(intRank) ?? 0}
        return 0
    }
}
