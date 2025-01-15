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
    
    func getPointsSortered() {
        self.filteredFootballTeams = filteredFootballTeams.sorted(by: { $0.intPoints?.codingKey.intValue ?? 0 > $1.intPoints?.codingKey.intValue ?? 0})
    }
    
    func getWinsSortered() {
        self.filteredFootballTeams = filteredFootballTeams.sorted(by: { $0.intWin?.codingKey.intValue ?? 0 > $1.intWin?.codingKey.intValue ?? 0})
    }
    
    func getDrawSortered() {
        self.filteredFootballTeams = filteredFootballTeams.sorted(by: { $0.intDraw?.codingKey.intValue ?? 0 > $1.intDraw?.codingKey.intValue ?? 0})
    }
    
    func getLossSortered() {
        self.filteredFootballTeams = filteredFootballTeams.sorted(by: { $0.intLoss?.codingKey.intValue ?? 0 > $1.intLoss?.codingKey.intValue ?? 0})
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


