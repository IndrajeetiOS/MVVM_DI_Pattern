//
//  NetworkManager.swift
//  MVVM_DI_Pattern
//
//  Created by Indra on 06/06/26.
//

import Foundation

protocol NetworkManaging {
    func request<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T
}

final class NetworkManager: NetworkManaging {

    func request<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T {

        let (data, response) = try await URLSession.shared.data(from: endpoint.url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard 200...299 ~= httpResponse.statusCode else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
