//
//  AppConfiguration.swift
//  MVVM_DI_Pattern
//
//  Created by Indra on 06/06/26.
//

import Foundation

enum Environment {
    case development
    case staging
    case production

    var baseURL: String {
        switch self {
        case .development:
            return "https://dummyjson.com"
        case .staging:
            return "https://dummyjson.com"
        case .production:
            return "https://dummyjson.com"
        }
    }
}

final class AppConfiguration {

    static let shared = AppConfiguration()

    let environment: Environment

    private init() {
        #if DEBUG
        environment = .development
        #else
        environment = .production
        #endif
    }
}
