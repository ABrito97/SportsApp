//
//  NavigationFootballList.swift
//  SportsApp
//
//  Created by Alejandro Brito on 13/01/25.
//

import SwiftUI

enum SortOrder: String, Identifiable, CaseIterable {
    case points, win, draw, loss
    
    var id: Self { self }
}

struct NavigationFootballList: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var sortOrder = SortOrder.points
    var body: some View {
        NavigationStack {
            FootballList(sortOrder: $sortOrder)
                .toolbar {
                    Menu(content: {
                        Picker("", selection: $sortOrder) {
                            ForEach(SortOrder.allCases) { sortOrder in
                                Text("Sort by \(sortOrder.rawValue)").tag(sortOrder)
                            }
                        }
                    },
                         label: { Label ("", systemImage: "line.3.horizontal.decrease.circle")
                    })
                    .tint(colorScheme == .dark ? .white : .black)
            }
        }
    }
}

#Preview {
    NavigationFootballList()
}
