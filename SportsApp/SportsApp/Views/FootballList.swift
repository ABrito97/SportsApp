//
//  FootballList.swift
//  SportsApp
//
//  Created by Alejandro Brito on 13/01/25.
//

import SwiftUI

struct FootballList: View {
    @State var searchText: String = ""
    @StateObject private var viewModel : FootballTeamsViewModel = FootballTeamsViewModel()
    
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
                    .offset(x: 185)
                }
                ForEach(viewModel.filteredFootballTeams) { element in
                    CellSoccerListView(footballTeams: element)
                }
            }
            .navigationTitle("Teams")
            .searchable(text: $searchText, prompt: "Search team")
            .onChange(of: searchText, perform: {  query in
                viewModel.getFilteredFootballTeams(query: query)
            })
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
        }
    }
}

#Preview {
    FootballList()
}
