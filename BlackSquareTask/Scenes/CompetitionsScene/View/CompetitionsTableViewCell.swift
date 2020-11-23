//
//  CompetitionsTableViewCell.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit

class CompetitionsTableViewCell: UITableViewCell {

    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var competitionNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CompetitionsTableViewCell: ConfigurableCell {
    func configure(model: Competition) {
        competitionNameLabel.text = "Zyad Galal"
        areaLabel.text = "Cairo"
        startDateLabel.text = "2019-09-04"
        endDateLabel.text = "2021-11-16"
    }
}
