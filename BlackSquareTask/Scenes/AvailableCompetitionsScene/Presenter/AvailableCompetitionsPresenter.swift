//
//  AvailableCompetitionsPresenter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 26/11/2020.
//

import Foundation

protocol AvailableCompetitionsView: class{
    var presenter: AvailableCompetitionsPresenter? {get set}
    func showIndicator()
    func dismissIndicator()
    func didFetchDataSuccessfully()
    func didFailFetchData(with message: String)
}

class AvailableCompetitionsPresenter{
    
    weak var view: AvailableCompetitionsView?
    var router: AvailableCompetitionsRouter
    var interactor: AvailableCompetitionsInteractor
    var modelItems : [CellConfigurator] = []
    var competitions: [Competition] = []
    typealias competitionCellConfig = TableCellConfigurator<CompetitionsTableViewCell, Competition>
    
    init (view: AvailableCompetitionsView, router: AvailableCompetitionsRouter, interactor: AvailableCompetitionsInteractor){
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad(){
        getCompetitions()
    }
    func getCompetitions(){
        view?.showIndicator()
        interactor.getCompetitions {[weak self] (result) in
            guard let self = self else {return}
            self.view?.dismissIndicator()
            switch result {
            case .success(let competitionsResponse):
                for competition in competitionsResponse {
                    self.competitions.append(competition)
                    let competitionCell = competitionCellConfig(item: competition)
                    self.modelItems.append(competitionCell)
                }

            self.view?.didFetchDataSuccessfully()
            case .failure(let error):
                self.view?.didFailFetchData(with: error.localizedDescription)
            }
        }
    }

    func getCompetition(at index: Int) -> CellConfigurator {
        return modelItems[index]
    }
    func getCompetitionsCount() -> Int{
        print("model items \(modelItems.count)")
        return modelItems.count
    }
    func didSelectCompetition(at index: Int){
        let competitionID = competitions[index].id
        router.navigateToTeamViewController(from: view!, with: competitionID)
    }
    
}
