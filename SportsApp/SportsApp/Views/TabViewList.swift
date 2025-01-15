//
//  TabViewList.swift
//  SportsApp
//
//  Created by Alejandro Brito on 13/01/25.
//

import SwiftUI

struct TabViewList: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView {
            NavigationFootballList()
                .tabItem {
                    VStack {
                        Image(systemName: "soccerball.inverse")
                        Text("Football")
                    }
                }
            Text("Favorites")
                .tabItem {
                    VStack{
                        Image(systemName: "star")
                        Text("Favorites")
                    }
                }
            Text("For you")
                .tabItem {
                    VStack{
                        Image(systemName: "person.bubble")
                        Text("For you")
                    }
                }
        }
        .tint(colorScheme == .dark ? .white : .black)
    }
}

#Preview {
    TabViewList()
}
