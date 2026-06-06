//
//  CommentsServiceProtocol.swift
//  MVVM_DI_Pattern
//
//  Created by Indra on 06/06/26.
//

import Foundation

protocol CommentsServiceProtocol {
    func fetchComments() async throws -> [Comment]
}

final class CommentsService: CommentsServiceProtocol {

    private let networkManager: NetworkManaging

    init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchComments() async throws -> [Comment] {
        let response: CommentsResponse =
            try await networkManager.request(.comments)
        return response.comments
    }
}
