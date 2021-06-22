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

    @Published var items: [MovieItem] = []
    @Published var loader: ModelLoader<MoviesList>?

    private var cancellableLoader: AnyCancellable?
    private var cancellableState: AnyCancellable?
    private var request: Result<URLRequest, Error>?

    private var latestPage: Int = 0
    private var totalPages: Int = 1

    func initRequest() {
        request = URLSession.shared.urlRequest(for: .moviesList(page: latestPage), using: UserSessionStore.userSession.accessToken)

        switch request {
        case .success(let request):
            loader = ModelLoader(urlRequest: request)
        case .failure(let error):
            loader?.state = .failed(error)
        case .none: break
        }

        cancellableLoader = loader?.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

    func nextFetchMoviesList() {
        guard latestPage < totalPages else { return }

        latestPage += 1

        initRequest()

        cancellableState = loader?
            .load()
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                if case .loaded(let result) = state {
                    self?.totalPages = result.totalPages
                    self?.items += result.results
                    self?.loader?.state = .finished
                }
            }
    }
}
