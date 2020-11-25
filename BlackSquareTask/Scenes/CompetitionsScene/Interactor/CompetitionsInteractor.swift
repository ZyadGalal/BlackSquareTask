//
//  CompetitionsInteractor.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation
import RealmSwift
//


class CompetitionsInteractor {
    func getCompetitions(completionHandler : @escaping (Result<CompetitionsModel,Error>) -> ()){
        NetworkClient.performRequest(_type: CompetitionsModel.self, router: .getCompetitions) { (result) in
            switch result {
            case .success(let competitionResponse):
                let realm = try! Realm()
                print(Realm.Configuration.defaultConfiguration.fileURL!)
                try! realm.write {
                    realm.add(competitionResponse, update: .all)
                }
                completionHandler(result)
            case .failure(let error):
                if let error = error.asAFError?.underlyingError as? URLError , error.code == .notConnectedToInternet{
                    self.getFromRealm(completionHandler: completionHandler)
                }
                else{
                    completionHandler(result)
                }
            }
            
        }
    }
    
    func getFromRealm(completionHandler : @escaping (Result<CompetitionsModel,Error>) -> ()){
        let realm = try! Realm()
        
        if let competitions = realm.objects(CompetitionsModel.self).first {
            return completionHandler(.success(competitions))
        }
        else{
            return completionHandler(.failure(NetworkError.NoInternetConnection))
        }
    }
}

enum NetworkError: Error, LocalizedError {
    case NoInternetConnection
    
    public var errorDescription: String? {
        switch self {
        case .NoInternetConnection:
            return "No Internet Connection"
        }
    }
}

