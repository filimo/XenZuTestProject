//
//  MovieDetailStore.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Combine
import Foundation

class MovieDetailStore: ObservableObject {
    private init() {}
    static let shared = MovieDetailStore()
    
    @Published private var loader: ModelLoader<MovieDetail>?
    @Published var state: ModelLoader<MovieDetail>.State = .idle

    private var cancellableLoader: AnyCancellable?
    private var request: Result<URLRequest, Error>?

    func fetchMovieDetail(id: MovieDetail.ID) {
        request = URLSession.shared.urlRequest(for: .movieDetail(withID: id))

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
        
        state = .loading
        
        loader?
            .load()
            .receive(on: RunLoop.main)
            .assign(to: &$state)
    }
}
