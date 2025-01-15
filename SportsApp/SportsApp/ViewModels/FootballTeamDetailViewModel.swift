//
//  FootballTeamDetailViewModel.swift
//  SportsApp
//
//  Created by Alejandro Brito on 14/01/25.
//

import Foundation

class FootballTeamDetailViewModel: ObservableObject {
    @Published var footballDetailTeam: FootballTeamDetailModel?
    let endPoints = EndPoints.shared
    
    init(teamName: String) {
        Task {
            await getFootballTeamDetail(teamName: teamName)
        }
    }
    
    func getFootballTeamDetail(teamName: String) async {
        Task {
            if let footballDetailTeam = await loadFrom(urlString: endPoints.getFootballDetailUrl(strFootballTeamName: teamName), memberType: FootballTeamDetailTable.self)?.teams?.first {
                DispatchQueue.main.async {
                    self.footballDetailTeam = footballDetailTeam
                }
            }
        }
    }
}
