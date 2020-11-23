//
//  TeamsTableViewCell.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {

    @IBOutlet weak var teamShortNameLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TeamsTableViewCell: ConfigurableCell{
    func configure(model: Team) {
        teamShortNameLabel.text = "Zozz"
        teamNameLabel.text = "Zyad Mahmoud Galal"
    }
}
