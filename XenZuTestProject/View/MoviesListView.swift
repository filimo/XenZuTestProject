//
//  MoviesListView.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import SwiftUI

// https://www.themoviedb.org/t/p/w220_and_h330_face/z8CExJekGrEThbpMXAmCFvvgoJR.jpg

struct MoviesListView: View {
    @ObservedObject var store = MoviesListStore.shared

    let items: [MovieItem]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(items, id: \.id) { item in
                    NavigationLink(destination: LazyView { MovieDetailView(id: item.id)
                    }) {
                        itemView(item: item)
                    }
                    .onAppear {
                        if items.last?.id == item.id {
                            store.nextFetchMoviesList()
                        }
                    }
                }
            }
        }
    }

    private func itemView(item: MovieItem) -> some View {
        HStack {
            ContentView.posterView(posterPath: item.posterPath)
                .frame(width: 100, height: 150)

            Spacer()

            VStack {
                HStack {
                    Text("\(item.originalTitle)")
                    Spacer()
                }

                HStack {
                    Text("\(item.releaseDate, formatter: DateFormatter.yearFormatter)")
                        .padding(.top, 5)
                    Spacer()
                }
                Spacer()
            }
        }
        .foregroundColor(.black)
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_Previews.previews
    }
}
