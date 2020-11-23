//
//  TeamInfoViewController.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit


class TeamInfoViewController: UIViewController{
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var websiteTextView: UITextView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var presenter: TeamInfoPresenter?
    override func viewDidLoad(){
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension TeamInfoViewController: TeamInfoView {
    func setTeamData(name: String, area: String, phone: String, address: String, website: String, logo: String) {
        nameLabel.text = name
        areaLabel.text = area
        phoneLabel.text = phone
        addressLabel.text = address
        websiteTextView.text = website
    }
}
