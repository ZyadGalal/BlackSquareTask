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
        let presenter = TeamInfoPresenter(view: teamInfoView, router: router, team: team)
        teamInfoView.presenter = presenter
        
        return teamInfoView
    }
}
