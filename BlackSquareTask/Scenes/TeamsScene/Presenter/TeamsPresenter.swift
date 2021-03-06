//
//  TeamsPresenter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation

protocol TeamsView: class{
    var presenter: TeamsPresenter? {get set}
    func showIndicator()
    func dismissIndicator()
    func didFetchDataSuccessfully()
    func didFailFetchData(with message: String)
}

class TeamsPresenter{
    
    weak var view: TeamsView?
    var router: TeamsRouter
    var interactor: TeamsInteractor
    let competitionID: Int?
    var teams: [Team] = []
    var modelItems : [CellConfigurator] = []
    typealias teamCellConfig = TableCellConfigurator<TeamsTableViewCell, Team>
    
    init (view: TeamsView, router: TeamsRouter, interactor: TeamsInteractor, competitionID: Int){
        self.view = view
        self.router = router
        self.interactor = interactor
        self.competitionID = competitionID
    }
    func viewDidLoad(){
        guard let competitionID = competitionID else { return }
        getTeams(with: competitionID)
    }
    func getTeams(with competitionID: Int){
        view?.showIndicator()
        interactor.getTeams(with: competitionID) {[weak self] (result) in
            guard let self = self else {return}
            self.view?.dismissIndicator()
            switch result {
            case .success(let teamsResponse):
                //check if there are any errors with response
                if teamsResponse.message != "" {
                    self.view?.didFailFetchData(with: teamsResponse.message)
                }
                else{
                    let teams = teamsResponse.teams
                    //config model items to prepare for viewing
                    self.teams.append(contentsOf: teams)
                    self.modelItems = teams.map({teamCellConfig(item: $0)})
                    //notify view for reloading table view data
                    self.view?.didFetchDataSuccessfully()
                }
            case .failure(let error):
                self.view?.didFailFetchData(with: error.localizedDescription)
            }
        }
    }
    
    func getTeamsCount() -> Int{
        return modelItems.count
    }
    func getTeam(at index: Int) -> CellConfigurator {
        return modelItems[index]
    }
    func didSelectTeam(at index: Int){
        let team = teams[index]
        router.navigateToTeamInfoViewController(from: view!, with: team)
    }
}
