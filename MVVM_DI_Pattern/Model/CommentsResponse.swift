//
//  CommentsResponse.swift
//  MVVM_DI_Pattern
//
//  Created by Indra on 06/06/26.
//

import Foundation

struct CommentsResponse: Codable {
    let comments: [Comment]
}

struct Comment: Codable, Identifiable {
    let id: Int
    let body: String
    let postId: Int
    let likes: Int
    let user: User
}

struct User: Codable {
    let id: Int
    let username: String
    let fullName: String
}
