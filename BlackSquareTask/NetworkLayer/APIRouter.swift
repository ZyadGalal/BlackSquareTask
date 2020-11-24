//
//  APIRouter.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter : URLRequestConvertible{
    
    case getCompetitions
    case getTeams(competitionID: Int)
    
    var method: HTTPMethod {
        switch self {
        case .getCompetitions:
            return .get
        case .getTeams(_):
            return .get
        }
    }
    var path : String {
        switch self {
        case .getCompetitions:
            return "competitions"
        case .getTeams(let competitionID):
            return "competitions/\(competitionID)/teams"
        }
    }
    var parameters : Parameters?{
        switch self {
        case .getCompetitions:
            return nil
        case .getTeams(_):
            return nil
        }
    }
    var token : String? {
        switch self {
        case .getCompetitions:
            return nil
        case .getTeams(_):
            return "ec775bfe0f1f4b44bd94227cb623f809"
        }
    }
    func asURLRequest () throws -> URLRequest{
        let url = try Constants.baseURL.asURL().appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.accept.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        

        if let parameters = parameters {
            return try URLEncoding.default.encode(urlRequest, with: parameters)

        }
        if let token = token {
            urlRequest.setValue(token, forHTTPHeaderField: HTTPHeaderField.apiToken.rawValue)
        }
        return urlRequest
    }
}
