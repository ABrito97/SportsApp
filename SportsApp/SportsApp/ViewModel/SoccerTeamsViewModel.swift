//
//  SoccerTeamsViewModel.swift
//  SportsApp
//
//  Created by Alejandro Brito on 13/01/25.
//

import Foundation

class SoccerTeamsViewModel: ObservableObject {
    
    let soccerTeamsUrl = "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2020-2021"
    @Published var soccerTeams : [SoccerTeamsModel] = []
    
    init() {
        Task {
            await getSoccerTeams()
        }
    }
    
    
    func getSoccerTeams() async {
        Task {
            if let soccerTeams = await loadFrom(urlString: self.soccerTeamsUrl, memberType: SoccerListTable.self)?.table {
                DispatchQueue.main.async {
                    self.soccerTeams = soccerTeams
                }
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


