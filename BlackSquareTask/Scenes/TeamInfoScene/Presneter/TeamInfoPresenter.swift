//
//  TeamInfoPresenter.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation

protocol TeamInfoView: class{
    var presenter: TeamInfoPresenter? {get set}
    func setTeamData(name: String, area: String, phone: String, address: String, website: String, logo: String)
}

class TeamInfoPresenter{
    
    weak var view: TeamInfoView?
    var router: TeamInfoRouter
    var interactor: TeamInfoInteractor
    let team: Team
    init (view: TeamInfoView, router: TeamInfoRouter, interactor: TeamInfoInteractor, team: Team){
        self.view = view
        self.router = router
        self.interactor = interactor
        self.team = team
    }
    func viewDidLoad(){
        view?.setTeamData(name: team.name ?? "", area: team.area?.name ?? "", phone: team.phone ?? "", address: team.address ?? "", website: team.website ?? "", logo: team.crestURL ?? "")
    }
}
