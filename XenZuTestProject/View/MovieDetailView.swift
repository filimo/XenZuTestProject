//
//  MovieDetailView.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import SwiftUI

struct MovieDetailView: View {
    let item: MovieItem.ID
    
    var body: some View {
        Text("Detail")
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(item: 1111)
    }
}
