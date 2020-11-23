//
//  TeamInfoRouter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit

class TeamInfoRouter {
    class func createTeamInfoViewController(for team: Team) -> UIViewController{
        let createViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController() as TeamInfoViewController
        
        if let createView = createViewController as? TeamInfoView{
            let router = TeamInfoRouter()
            let interactor = TeamInfoInteractor()
            let presenter = TeamInfoPresenter(view: createView, router: router, interactor: interactor, team: team)
            createView.presenter = presenter
        }
        return createViewController
    }
}
