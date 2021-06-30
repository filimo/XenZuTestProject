//
//  MovieDetailView.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Resolver
import SwiftUI

struct MovieDetailView: View {
    let id: MovieItem.ID

    @InjectedObject var store: MovieDetailStore

    init(id: MovieItem.ID) {
        self.id = id
        store.fetchMovieDetail(id: id)
    }

    var body: some View {
        ScrollView {
            switch store.state {
            case .finished:
                EmptyView()
            case .idle:
                Text("Loading...")
            case .loading:
                Text("Loading...")
            case .loaded(let item):
                infoView(item: item)
                    .padding()
            case .failed(let error):
                Text("\(error.localizedDescription)")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private func infoView(item: MovieDetail) -> some View {
        VStack {
            ContentView.posterView(posterPath: item.posterPath)
                .frame(width: 200, height: 300)

            HStack {
                VStack {
                    HStack {
                        Text("\(item.originalTitle)")
                            .font(.headline)
                        Spacer()
                    }

                    HStack {
                        Text("\(item.releaseDate, formatter: DateFormatter.yearFormatter)")
                        Spacer()
                    }
                }
            }

            Text(item.overview)
                .padding(.top, 5)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(id: 1111)
    }
}
