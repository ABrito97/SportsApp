//
//  CellSoccerListView.swift
//  SportsApp
//
//  Created by Alejandro Brito on 13/01/25.
//

import SwiftUI

struct CellSoccerListView: View {
    var soccerTeams: SoccerTeamsModel
    var body: some View {
        HStack {
            HStack {
                Text(soccerTeams.intRank ?? "")
                    .multilineTextAlignment(.trailing)
                    .font(.headline)
                    .bold()
                soccerTeams.imgBadge
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.gray)
                    .clipShape(.circle)
                Text(soccerTeams.strTeam ?? "")
                    .multilineTextAlignment(.trailing)
                    .font(.headline)
                    .offset(x: 15)
                    .bold()
            }
            Spacer(minLength: 50)
            HStack {
                Text(soccerTeams.intPoints ?? "")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .bold()
                Text(soccerTeams.intWin ?? "")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .bold()
                Text(soccerTeams.intDraw ?? "")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .bold()
                Text(soccerTeams.intLoss ?? "")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .bold()
            }
        }
    }
}
