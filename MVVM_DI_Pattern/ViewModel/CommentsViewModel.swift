//
//  CommentsViewModel.swift
//  MVVM_DI_Pattern
//
//  Created by Indra on 06/06/26.
//

import Foundation
import Combine

@MainActor final class CommentsViewModel: ObservableObject {

    @Published private(set) var comments: [Comment] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: CommentsServiceProtocol

    init(service: CommentsServiceProtocol? = nil) {
        if let service {
            self.service = service
        } else {
            // This runs on the main actor due to the class annotation
            self.service = CommentsService()
        }
    }

    func loadComments() async {

        isLoading = true
        defer { isLoading = false }

        do {
            comments = try await service.fetchComments()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
