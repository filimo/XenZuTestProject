//
//  ContentView.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Resolver
import SwiftUI

struct ContentView: View {
    @InjectedObject var store: MoviesListStore

    var body: some View {
        NavigationView {
            VStack {
                MoviesListView(items: store.items)
                    .padding(.horizontal)

                Group {
                    switch store.loader?.state {
                    case .loaded:
                        Text("Loading...")
                    case .none:
                        Text("Starting...")
                    case .some(.idle):
                        Text("Starting...")
                    case .some(.loading):
                        Text("Loading...")
                    case .some(.failed(let error)):
                        Text("\(error.localizedDescription)")
                    case .some(.finished):
                        EmptyView()
                    }
                }
                .padding(.vertical)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            store.nextFetchMoviesList()
        }
    }

    @ViewBuilder
    static func posterView(posterPath: String) -> some View {
        if let url = URL(string: "https://www.themoviedb.org/t/p/w220_and_h330_face/\(posterPath)") {
            AsyncImage(
                url: url,
                placeholder:
                Rectangle().foregroundColor(.gray),

                configuration: { $0.resizable() }
            )
        } else {
            Rectangle().foregroundColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
