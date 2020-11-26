//
//  AvailableCompetitionsRouter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 26/11/2020.
//

import UIKit

class AvailableCompetitionsRouter {
    class func createAvailableCompetitionsViewController() -> UIViewController{
        
        
        let AvailableCompetitionsView = AvailableCompetitionsViewController(nibName: "AvailableCompetitions", bundle: nil)
        let router = AvailableCompetitionsRouter()
        let interactor = AvailableCompetitionsInteractor()
        let presenter = AvailableCompetitionsPresenter(view: AvailableCompetitionsView, router: router, interactor: interactor)
        AvailableCompetitionsView.presenter = presenter
        
        return AvailableCompetitionsView
    }
    
    func navigateToTeamViewController(from view: AvailableCompetitionsView, with competitionID: Int){
        let teamsViewController = TeamsRouter.createTeamsViewController(for: competitionID)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(teamsViewController, animated: true)
        }
    }
}
