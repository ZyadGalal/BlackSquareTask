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
        competitionNameLabel.text = model.name ?? ""
        areaLabel.text = model.area?.name ?? ""
        startDateLabel.text = model.currentSeason?.startDate ?? ""
        endDateLabel.text = model.currentSeason?.endDate ?? ""
    }
}
