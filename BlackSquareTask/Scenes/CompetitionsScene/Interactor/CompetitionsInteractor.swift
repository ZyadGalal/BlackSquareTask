//
//  CompetitionsInteractor.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation
import RealmSwift


class CompetitionsInteractor {
    func getCompetitions(completionHandler : @escaping(Result<List<Competition>,Error>) -> ()){
        NetworkClient.performRequest(_type: CompetitionsModel.self, router: .getCompetitions) { (result) in
            switch result {
            case .success(let competitionResponse):
                print(Realm.Configuration.defaultConfiguration.fileURL!)
                let realm = try! Realm()
                try! realm.write {
                    realm.add(competitionResponse, update: .all)
                }
                completionHandler(.success(competitionResponse.competitions))
            case .failure(let error):
                //MARK: -check if no internet connection to try to fetch data from local database
                if let error = error.asAFError?.underlyingError as? URLError , error.code == .notConnectedToInternet{
                    self.getFromRealm(completionHandler: completionHandler)
                }
                else{
                    completionHandler(.failure(error))
                }
            }
            
        }
    }
    //MARK: -check if local database have the data needed
    func getFromRealm(completionHandler : @escaping (Result<List<Competition>,Error>) -> ()){
        let realm = try! Realm()
        if let competitions = realm.objects(CompetitionsModel.self).first {
            return completionHandler(.success(competitions.competitions))
        }
        else{
            return completionHandler(.failure(NetworkError.NoInternetConnection))
        }
    }
}
