//
//  CompetitionsInteractor.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation

class CompetitionsInteractor {
    func getCompetitions(completionHandler : @escaping (Result<CompetitionsModel,Error>) -> ()){
        NetworkClient.performRequest(_type: CompetitionsModel.self, router: .getCompetitions, completion: completionHandler)
    }
}
