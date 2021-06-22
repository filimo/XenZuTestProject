//
//  MoviesListView.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import SwiftUI


// https://www.themoviedb.org/t/p/w220_and_h330_face/z8CExJekGrEThbpMXAmCFvvgoJR.jpg

struct MoviesListView: View {
    let items: MoviesList
    
    var body: some View {
        ScrollView {
            ForEach(items.results, id: \.id) { item in
                HStack {
                    posterView(posterPath: item.posterPath)
                        .frame(width: 100, height: 150)

                    Spacer()

                    VStack {
                        HStack {
                            Text("\(item.originalTitle)")
                            Spacer()
                        }

                        HStack {
                            Text("\(item.releaseDate, formatter: itemFormatter)")
                                .padding(.top, 5)
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }
    }
    
    
    @ViewBuilder
    private func posterView(posterPath: String) -> some View {
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


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.setLocalizedDateFormatFromTemplate("yyyy")
    return formatter
}()

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_Previews.previews
    }
}
