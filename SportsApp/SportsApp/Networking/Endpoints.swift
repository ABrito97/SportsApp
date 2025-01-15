//
//  Endpoints.swift
//  SportsApp
//
//  Created by Alejandro Brito on 15/01/25.
//

import Foundation

class EndPoints {
    let baseUrl = "https://www.thesportsdb.com/api/v1/json/3/"
    let footballTeamsUrl = "lookuptable.php?l=4328&s=2020-2021"
    let footballTeamDetailUrl = "searchteams.php?t="
    private init(){}
    
    static var shared: EndPoints = {
        let instance = EndPoints()
        return instance
    }()
    
    func getFootballListUrl() -> String {
        return "\(baseUrl)\(footballTeamsUrl)"
    }
    
    func getFootballDetailUrl(strFootballTeamName: String) -> String {
        return "\(baseUrl)\(footballTeamDetailUrl)\(strFootballTeamName)"
    }
}
