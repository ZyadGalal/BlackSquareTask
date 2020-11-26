//
//  AvailableCompetitionsInteractor.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 26/11/2020.
//

import Foundation
import RealmSwift

class AvailableCompetitionsInteractor {
    func getCompetitions(with availableIDs: [Int], completionHandler : @escaping(Result<List<Competition>,Error>) -> ()){
        let realm = try! Realm()
        let availableCompetitions = List<Competition>()
        for availableID in availableIDs {
            if let competition = realm.object(ofType: Competition.self, forPrimaryKey: availableID) {
                availableCompetitions.append(competition)
            }
        }
        if availableCompetitions.count != 0{
            completionHandler(.success(availableCompetitions))
        }
        else{
            completionHandler(.failure(NetworkError.NoInternetConnection))
        }
    }
}
 
