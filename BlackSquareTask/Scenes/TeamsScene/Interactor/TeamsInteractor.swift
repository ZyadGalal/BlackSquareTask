//
//  TeamsInteractor.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation

class TeamsInteractor {
    func getTeams(with competitionID: Int, completionHandler : @escaping (Result<TeamsModel,Error>) -> ()){
        NetworkClient.performRequest(_type: TeamsModel.self, router: .getTeams(competitionID: competitionID), completion: completionHandler)
    }
}
