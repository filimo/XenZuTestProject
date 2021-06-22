//
//  MoviesListStore.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Combine
import Foundation

class MoviesListStore: ObservableObject {
    static let shared = MoviesListStore()

    @Published var loader: ModelLoader<MoviesList>?

    private var cancellable: AnyCancellable?
    private let request = URLSession.shared.urlRequest(for: .moviesList(), using: UserSessionStore.userSession.accessToken)

    init() {
        switch request {
        case .success(let request):
            loader = ModelLoader(urlRequest: request)
        case .failure(let error):
            loader?.state = .failed(error)
        }
        
        cancellable = loader?.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

    func fetchMoviesList() {
        loader?.load()
    }
}
