//
//  ContentView.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var store = MoviesListStore.shared

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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
