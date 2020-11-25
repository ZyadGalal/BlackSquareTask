//
//  TeamsRouter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit

class TeamsRouter {
    class func createTeamsViewController(for competitionID: Int) -> UIViewController{
        let teamsView = TeamsViewController(nibName: "Teams", bundle: nil)
        let router = TeamsRouter()
        let interactor = TeamsInteractor()
        let presenter = TeamsPresenter(view: teamsView, router: router, interactor: interactor, competitionID: competitionID)
        teamsView.presenter = presenter
        
        return teamsView
    }
    
    func navigateToTeamInfoViewController(from view: TeamsView, with TeamID: Team){
        let teamsViewController = TeamInfoRouter.createTeamInfoViewController(for: TeamID)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(teamsViewController, animated: true)
        }
    }
}
