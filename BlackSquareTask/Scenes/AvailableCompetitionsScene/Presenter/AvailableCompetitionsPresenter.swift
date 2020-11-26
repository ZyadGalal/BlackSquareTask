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
    let availableIDs = [2000,2001,2002,2003,2013,2014,2015,2016,2017,2018,2019,2021]
    
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
        
        interactor.getCompetitions(with: availableIDs) {[weak self] (result) in
            guard let self = self else {return}
            self.view?.dismissIndicator()
            switch result {
            case .success(let competitionsResponse):
                self.competitions.append(contentsOf: competitionsResponse)
                self.modelItems = competitionsResponse.map({return competitionCellConfig(item: $0)})
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
