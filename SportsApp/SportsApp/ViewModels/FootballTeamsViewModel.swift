//
//  SoccerTeamsViewModel.swift
//  SportsApp
//
//  Created by Alejandro Brito on 13/01/25.
//

import Foundation

class FootballTeamsViewModel: ObservableObject {
    @Published var footballTeams : [FootballTeamsModel] = []
    @Published var filteredFootballTeams : [FootballTeamsModel] = []
    let endPoints = EndPoints.shared
    
    init() {
        Task {
            await getFootballTeams()
        }
    }
    
    func getFootballTeams() async {
        Task {
            if let footballTeams = await loadFrom(urlString: endPoints.getFootballListUrl(), memberType: FootballListTable.self)?.table {
                DispatchQueue.main.async {
                    self.footballTeams = footballTeams
                    self.filteredFootballTeams = self.footballTeams
                }
            }
        }
    }
    
    func getFilteredFootballTeams(query: String) {
        if query.isEmpty {
            self.filteredFootballTeams = footballTeams
        } else {
            self.filteredFootballTeams = footballTeams.filter { team in
                if let name = team.strTeam {
                    return name.lowercased().replacingOccurrences(of: " ", with: "").contains(query.lowercased().replacingOccurrences(of: " ", with: ""))
                }
                return false
            }
        }
    }
}

func loadFrom<T: Decodable>(urlString: String, memberType: T.Type) async -> T? {
    guard let url = URL(string: urlString) else { return nil }
    guard let (data,_ ) = try? await URLSession.shared.data(from: url) else { return nil}

    let decoder = JSONDecoder()
    guard let result = try? decoder.decode(T.self, from: data) else { return nil }
    return result
}


