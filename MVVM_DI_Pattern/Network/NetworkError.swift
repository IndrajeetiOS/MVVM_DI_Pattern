//
//  NetworkError.swift
//  MVVM_DI_Pattern
//
//  Created by Indra on 06/06/26.
//

import Foundation

enum NetworkError: LocalizedError {

    case invalidResponse
    case decodingFailed
    case serverError(Int)

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid Response"

        case .decodingFailed:
            return "Decoding Failed"

        case .serverError(let code):
            return "Server Error: \(code)"
        }
    }
}
