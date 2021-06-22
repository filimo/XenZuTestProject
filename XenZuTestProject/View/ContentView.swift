//
//  ContentView.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = MoviesListStore.shared

    init() {
        store.fetchMoviesList()
    }

    var body: some View {
        switch store.loader?.state {
        case .loaded(let items):
            ForEach(items.results, id: \.id) { item in
                Text("\(item.originalTitle)")
            }
        case .none:
            EmptyView()
        case .some(.idle):
            EmptyView()
        case .some(.loading):
            Text("Loading...")
        case .some(.failed(let error)):
            Text("\(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
