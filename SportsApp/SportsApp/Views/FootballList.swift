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
    @Binding var sortOrder: SortOrder
    
    var body: some View {
        VStack {
            List {
                HStack {
                    HStack {
                        Text("#")
                        Text("TEAM")
                            .offset(x: 40)
                    }
                    Spacer(minLength: 40)
                    HStack {
                        Text("P")
                        Text(" W")
                        Text(" D")
                        Text(" L")
                    }
                    .padding(.horizontal, 20)
                }
                ForEach(viewModel.filteredFootballTeams) { element in
                    CellSoccerListView(footballTeams: element)
                }
            }
            .navigationTitle("Teams")
            .searchable(text: $searchText, prompt: "Search team")
            .onChange(of: searchText) {
                viewModel.getFilteredFootballTeams(query: searchText)
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
        }
        .onChange(of: sortOrder) {
            switch sortOrder {
            case .points:
                viewModel.getPointsSortered()
            case .win:
                viewModel.getWinsSortered()
            case .draw:
                viewModel.getDrawSortered()
            case .loss:
                viewModel.getLossSortered()
            }
        }
    }
}
