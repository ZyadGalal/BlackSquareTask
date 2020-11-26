//
//  CompetitionsRouter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit

class CompetitionsRouter {
    class func createCompetitionsViewController() -> UIViewController{
        let competitionView = CompetitionsViewController(nibName: "Competition", bundle: nil)
        let router = CompetitionsRouter()
        let interactor = CompetitionsInteractor()
        let presenter = CompetitionsPresenter(view: competitionView, router: router, interactor: interactor)
        competitionView.presenter = presenter
        
        return competitionView
    }
    func navigateToAvailableCompetitionViewController(from view: CompetitionsView){
        let teamsViewController = AvailableCompetitionsRouter.createAvailableCompetitionsViewController()
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(teamsViewController, animated: true)
        }
    }
}
