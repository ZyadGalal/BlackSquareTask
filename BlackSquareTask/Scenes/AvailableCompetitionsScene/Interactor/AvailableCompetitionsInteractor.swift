//
//  AvailableCompetitionsInteractor.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 26/11/2020.
//

import Foundation
import RealmSwift

class AvailableCompetitionsInteractor {
    func getCompetitions(completionHandler : @escaping(Result<List<Competition>,Error>) -> ()){
        let availableIDs = [2000,2001,2002,2003,2013,2014,2015,2016,2017,2018,2019,2021]
        let realm = try! Realm()
        let availableCompetitions = List<Competition>()
        for availableID in availableIDs {
            if let competition = realm.object(ofType: Competition.self, forPrimaryKey: availableID) {
                availableCompetitions.append(competition)
            }
            
        }
        completionHandler(.success(availableCompetitions))
    }
}
 
