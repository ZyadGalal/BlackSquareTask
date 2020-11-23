//
//  CompetitionsRouter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit

class CompetitionsRouter {
    class func createCompetitionsViewController() -> UIViewController{
        let createViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController() as CompetitionsViewController
        
        if let createView = createViewController as? CompetitionsView{
            let router = CompetitionsRouter()
            let interactor = CompetitionsInteractor()
            let presenter = CompetitionsPresenter(view: createView, router: router, interactor: interactor)
            createView.presenter = presenter
        }
        return createViewController
    }
    func navigateToTeamViewController(from view: CompetitionsView, with competitionID: Int){
        let teamsViewController = TeamsRouter.createTeamsViewController(for: competitionID)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(teamsViewController, animated: true)
        }
    }
}
