//
//  FootballList.swift
//  SportsApp
//
//  Created by Alejandro Brito on 13/01/25.
//

import SwiftUI

struct FootballList: View {
    @State var searchText: String = ""
    @StateObject private var viewModel : SoccerTeamsViewModel = SoccerTeamsViewModel()
    var body: some View {
        VStack {
            List {
                HStack {
                    HStack {
                        Text("#")
                        Text("TEAM")
                            .offset(x: 40)
                    }
                    HStack {
                        Text("P")
                        Text("W")
                        Text("D")
                        Text("L")
                    }
                    .offset(x: 210)
                }
                ForEach(viewModel.soccerTeams) { element in
                    CellSoccerListView(soccerTeams: element)
                }
            }
            .navigationTitle("Teams")
            .searchable(text: $searchText, prompt: "Buscar")
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
        }
    }
}

#Preview {
    FootballList()
}
