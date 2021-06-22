//
//  URLSession.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Combine
import Foundation

extension URLSession {
    func urlRequest<K, R>(
        for endpoint: Endpoint<K, R>,
        using requestData: K.RequestData
    ) -> Result<URLRequest, Error> {
        guard let request = endpoint.makeRequest(with: requestData) else {
            return .failure(InvalidEndpointError(endpoint: endpoint))
        }

        return .success(request)
    }
}
