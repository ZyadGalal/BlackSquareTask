//
//  CompetitionsPresenter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation

protocol CompetitionsView: class{
    var presenter: CompetitionsPresenter? {get set}
    func showIndicator()
    func dismissIndicator()
    func didFetchDataSuccessfully()
    func didFailFetchData(with message: String)
}

class CompetitionsPresenter{
    
    weak var view: CompetitionsView?
    var router: CompetitionsRouter
    var interactor: CompetitionsInteractor
    var modelItems : [CellConfigurator] = []
    var competitions: [Competition] = []
    typealias competitionCellConfig = TableCellConfigurator<CompetitionsTableViewCell, Competition>

    init (view: CompetitionsView, router: CompetitionsRouter, interactor: CompetitionsInteractor){
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad(){
        setFakeData()
    }
    func setFakeData(){
        let competition = Competition(id: 1, area: nil, name: "zzz", code: "cdc", emblemURL: "dcdcdc", plan: nil, currentSeason: nil, numberOfAvailableSeasons: 1, lastUpdated: nil)
        let competitionCell = competitionCellConfig(item: competition)
        modelItems.append(competitionCell)
        modelItems.append(competitionCell)
        modelItems.append(competitionCell)
        modelItems.append(competitionCell)
        modelItems.append(competitionCell)
        modelItems.append(competitionCell)
        modelItems.append(competitionCell)
        modelItems.append(competitionCell)
        modelItems.append(competitionCell)
        modelItems.append(competitionCell)
    }
    func getCompetition(at index: Int) -> CellConfigurator {
        return modelItems[index]
    }
    func getCompetitionsCount() -> Int{
        return modelItems.count
    }
    func didSelectCompetition(at index: Int){
        guard let competitionID = competitions[index].id else {return}
        router.navigateToTeamViewController(from: view!, with: competitionID)
    }
}
