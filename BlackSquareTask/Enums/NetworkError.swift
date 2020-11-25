//
//  NetworkError.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 25/11/2020.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case NoInternetConnection
    
    public var errorDescription: String? {
        switch self {
        case .NoInternetConnection:
            return "No Internet Connection"
        }
    }
}
