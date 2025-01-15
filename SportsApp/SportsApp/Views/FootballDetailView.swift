//
//  FootballDetailView.swift
//  SportsApp
//
//  Created by Alejandro Brito on 14/01/25.
//

import SwiftUI

struct FootballDetailView: View {
    @State var isExpanded = false
    var teamName: String
    @StateObject private var viewModel : FootballTeamDetailViewModel
    
    init(teamName: String) {
        self.teamName = teamName
        _viewModel = StateObject(wrappedValue: FootballTeamDetailViewModel(teamName: teamName))
    }
    
       var body: some View {
           GeometryReader(content: { geometry in
               VStack {
                   ScrollView {
                       VStack {
                           ZStack{
                               Rectangle()
                                   .fill(.thinMaterial)
                                   .frame(height: geometry.size.height * 0.40)
                               AsyncImage(url: URL(string: viewModel.footballDetailTeam?.strFanart1 ?? "")) { phase in
                                   switch phase {
                                   case .failure:
                                       Image(systemName: "photo")
                                           .font(.largeTitle)
                                   case .success(let image):
                                       image
                                           .resizable()
                                   default:
                                       ProgressView()
                                   }
                               }
                               .frame(height: geometry.size.height * 0.40)
                               .clipped()
                           }
                           
                           VStack(alignment: .leading) {
                               HStack {
                                   Text(viewModel.footballDetailTeam?.strSport ?? "")
                                       .font(.subheadline)
                                       .foregroundStyle(.gray)
                                   Spacer()
                                   AsyncImage(url: URL(string: viewModel.footballDetailTeam?.strBadge ?? "")) { phase in
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
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.yellow)
                               }
                               .padding(.bottom, 5)

                               Text(viewModel.footballDetailTeam?.strTeam ?? "")
                                   .font(.title2)
                                   .fontWeight(.medium)
                               Text(viewModel.footballDetailTeam?.strTeamAlternate ?? "")
                                   .font(.subheadline)
                                   .foregroundStyle(.gray)
                                   .padding(.bottom, 5)
                               Spacer()
                               Text(viewModel.footballDetailTeam?.strCountry ?? "")
                                   .font(.body)
                                   .fontWeight(.medium)
                                   .padding(.bottom, 5)
                               Spacer()
                               Text(viewModel.footballDetailTeam?.strStadium ?? "")
                                   .font(.body)
                                   .fontWeight(.medium)
                               Text("Capacity: \(viewModel.footballDetailTeam?.intStadiumCapacity ?? "")")
                                   .font(.subheadline)
                                   .foregroundStyle(.gray)
                                   .padding(.bottom, 5)
                               Spacer()
                               Text("Description")
                                   .font(.title2)
                                   .fontWeight(.medium)
                                   .padding(.bottom, 5)
                               Text(viewModel.footballDetailTeam?.strDescriptionEN ?? "")
                                   .foregroundStyle(.gray)
                                   .lineLimit(isExpanded ? nil : 10)
                               Button(action: {
                                   withAnimation {
                                       isExpanded.toggle()
                                   }
                               }, label: {
                                   Text(isExpanded ? "Read Less" : "Read More")
                                       .fontWeight(.medium)
                                       .underline()
                               })
                               
                           }
                           .padding()
                           .background(Color("BackgroundColor"))
                       }
                   }
               }
           })
           .edgesIgnoringSafeArea(.top)
       }
}

#Preview {
   FootballDetailView(teamName: "Manchester City")
}
