//
//  TeamsPresenter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation

protocol TeamsView: class{
    var presenter: TeamsPresenter? {get set}
}

class TeamsPresenter{
    
    weak var view: TeamsView?
    var router: TeamsRouter
    var interactor: TeamsInteractor
    let competitionID: Int?
    var modelItems : [CellConfigurator] = []
    typealias teamCellConfig = TableCellConfigurator<TeamsTableViewCell, Team>
    
    init (view: TeamsView, router: TeamsRouter, interactor: TeamsInteractor, competitionID: Int){
        self.view = view
        self.router = router
        self.interactor = interactor
        self.competitionID = competitionID
    }
    func viewDidLoad(){
        setFakeData()
    }
    func setFakeData(){
        let team = Team(id: 1, area: nil, name: "dc", shortName: "", tla: "", crestURL: "", address: "", phone: "", website: "", email: "", founded: 1, clubColors: "", venue: "", lastUpdated: nil)
        let cellConfig = teamCellConfig(item: team)
        modelItems.append(cellConfig)
        modelItems.append(cellConfig)
        modelItems.append(cellConfig)
        modelItems.append(cellConfig)
        modelItems.append(cellConfig)
        modelItems.append(cellConfig)
        modelItems.append(cellConfig)
        modelItems.append(cellConfig)
    }
    func getTeamsCount() -> Int{
        return modelItems.count
    }
    func getTeam(at index: Int) -> CellConfigurator {
        return modelItems[index]
    }
    func didSelectTeam(at index: Int){
        //change index with team id
        let area = TeamArea(id: 1, name: "cairo")
        let team = Team(id: 1, area: area, name: "Zyad FC", shortName: "", tla: "", crestURL: "", address: "6 october city - el khamayel city villa 68", phone: "01011226220", website: "Https://www.google.com", email: "zyad_mg@yahoo.com", founded: 1, clubColors: "", venue: "", lastUpdated: nil)
        router.navigateToTeamInfoViewController(from: view!, with: team)
    }
}
