//
//  ModelLoader.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Foundation
import Combine

class ModelLoader<Model: Decodable>: ObservableObject {
    enum State {
        case idle
        case loading
        case loaded(Model)
        case finished
        case failed(Error)
    }

    @Published var state = State.idle
    
    private let urlRequest: URLRequest
    private let session: URLSession
    private let decoder: JSONDecoder
    
    private var cancellable: AnyCancellable?
    
    init(urlRequest: URLRequest, session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.urlRequest = urlRequest
        self.session = session
        self.decoder = decoder
    }

    func load() -> AnyPublisher<ModelLoader<Model>.State, Never> {
            state = .loading

            return session
                .dataTaskPublisher(for: urlRequest)
                .map(\.data)
                .decode(type: Model.self, decoder: decoder)
                .map(State.loaded)
                .catch { error in
                    Just(.failed(error))
                }
                .eraseToAnyPublisher()
        }
}
