//
//  CellFootballListView.swift
//  SportsApp
//
//  Created by Alejandro Brito on 13/01/25.
//

import SwiftUI

struct CellSoccerListView: View {
    var footballTeams: FootballTeamsModel
    var body: some View {
        NavigationLink(destination: {FootballDetailView(teamName: footballTeams.strTeam ?? "")}) {
        HStack {
            HStack {
                    Text(footballTeams.intRank ?? "")
                        .multilineTextAlignment(.trailing)
                        .font(.headline)
                        .bold()
                    AsyncImage(url: URL(string: footballTeams.strBadge ?? "")) { phase in
                        switch phase {
                        case .failure:
                            Image(systemName: "soccerball.circle")
                                .font(.largeTitle)
                        case .success(let image):
                            image
                                .resizable()
                        default:
                            ProgressView()
                        }
                    }
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.gray)
                    .clipShape(.circle)
                    Text(footballTeams.strTeam ?? "")
                        .multilineTextAlignment(.trailing)
                        .font(.headline)
                        .offset(x: 10)
                        .bold()
                }
                Spacer(minLength: 40)
                HStack {
                    Text(footballTeams.intPoints ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                        .bold()
                    Text(footballTeams.intWin ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                        .bold()
                    Text(footballTeams.intDraw ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                        .bold()
                    Text(footballTeams.intLoss ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                        .bold()
                }
            }
        }
    }
}
