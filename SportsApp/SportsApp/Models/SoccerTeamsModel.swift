//
//  SoccerTeamsModel.swift
//  SportsApp
//
//  Created by Alejandro Brito on 13/01/25.
//

import SwiftUI

struct SoccerListTable: Hashable, Codable {
    var table: [SoccerTeamsModel]?
}

struct SoccerTeamsModel: Hashable, Codable, Identifiable {
    var intRank: String?
    var strTeam: String?
    var intPoints: String?
    var intWin: String?
    var intLoss: String?
    var intDraw: String?
    
    var id: Int {
        if let intRank = intRank { return Int(intRank) ?? 0}
        return 0
    }
    
    private var strBadge: String
    
    var imgBadge: Image { 
        if strBadge.elementsEqual("") {
            return Image(systemName: "person.crop.circle.fill")
        } else {
            return Image(strBadge)
        }
        
        
    }
}
