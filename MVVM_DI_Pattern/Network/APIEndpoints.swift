//
//  APIEndpoints.swift
//  MVVM_DI_Pattern
//
//  Created by Indra on 06/06/26.
//

import Foundation

enum APIEndpoint {

    case comments

    var path: String {
        switch self {
        case .comments:
            return "/comments"
        }
    }
    
    var baseURL: String {
        AppConfiguration.shared.environment.baseURL
    }
    
    var url: URL {
        URL(string: "\(baseURL)\(path)")!
    }
}
