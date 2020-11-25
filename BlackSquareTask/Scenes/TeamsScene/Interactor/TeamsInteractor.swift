//
//  TeamsInteractor.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation
import RealmSwift
class TeamsInteractor {
    func getTeams(with competitionID: Int, completionHandler : @escaping (Result<TeamsModel,Error>) -> ()){
        NetworkClient.performRequest(_type: TeamsModel.self, router: .getTeams(competitionID: competitionID)) { (result) in
            switch result {
            case .success(let teamsResponse):
                //set primary key to get data from local database with it
                teamsResponse.id = competitionID
                
                print(Realm.Configuration.defaultConfiguration.fileURL!)
                let realm = try! Realm()
                try! realm.write {
                    realm.add(teamsResponse, update: .all)
                }
                completionHandler(result)
            case .failure(let error):
                //MARK: -check if no internet connection to try to fetch data from local database
                if let error = error.asAFError?.underlyingError as? URLError , error.code == .notConnectedToInternet{
                    self.getFromRealm(competitionID: competitionID, completionHandler: completionHandler)
                }
                else{
                    completionHandler(result)
                }
            }
        }
    }
    //MARK: -check if local database have the data needed
    func getFromRealm(competitionID: Int,completionHandler : @escaping (Result<TeamsModel,Error>) -> ()){
        let realm = try! Realm()
        
        if let teams = realm.objects(TeamsModel.self).filter("id == \(competitionID)").first {
            return completionHandler(.success(teams))
        }
        else{
            return completionHandler(.failure(NetworkError.NoInternetConnection))
        }
    }
}
