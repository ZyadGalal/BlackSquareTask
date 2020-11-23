//
//  TeamsRouter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit

class TeamsRouter {
    class func createTeamsViewController(for competitionID: Int) -> UIViewController{
        let createViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController() as TeamsViewController
        
        if let createView = createViewController as? TeamsView{
            let router = TeamsRouter()
            let interactor = TeamsInteractor()
            let presenter = TeamsPresenter(view: createView, router: router, interactor: interactor, competitionID: competitionID)
            createView.presenter = presenter
        }
        return createViewController
    }
    
    func navigateToTeamInfoViewController(from view: TeamsView, with TeamID: Team){
        let teamsViewController = TeamInfoRouter.createTeamInfoViewController(for: TeamID)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(teamsViewController, animated: true)
        }
    }
}
