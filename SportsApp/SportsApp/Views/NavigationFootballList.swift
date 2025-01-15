//
//  NavigationFootballList.swift
//  SportsApp
//
//  Created by Alejandro Brito on 13/01/25.
//

import SwiftUI

struct NavigationFootballList: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
           FootballList()
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button(action: {}, label: {
                            Image(systemName: "ellipsis.circle")
                                .tint(colorScheme == .dark ? .white : .black)
                        })
                    }
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button(action: {}, label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .tint(colorScheme == .dark ? .white : .black)
                        })
                    }
                }
        }
    }
}

#Preview {
    NavigationFootballList()
}
