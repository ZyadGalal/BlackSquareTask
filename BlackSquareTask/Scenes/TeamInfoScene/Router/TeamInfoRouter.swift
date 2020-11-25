//
//  TeamInfoRouter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit

class TeamInfoRouter {
    class func createTeamInfoViewController(for team: Team) -> UIViewController{
        let teamInfoView = TeamInfoViewController(nibName: "TeamInfo", bundle: nil)
        let router = TeamInfoRouter()
        let interactor = TeamInfoInteractor()
        let presenter = TeamInfoPresenter(view: teamInfoView, router: router, interactor: interactor, team: team)
        teamInfoView.presenter = presenter
        
        return teamInfoView
    }
}
