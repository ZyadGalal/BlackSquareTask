//
//  TeamsTableViewCell.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit
import Kingfisher

class TeamsTableViewCell: UITableViewCell {

    @IBOutlet weak var teamShortNameLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override func prepareForReuse() {
        teamNameLabel.text = nil
        teamShortNameLabel.text = nil
        teamImageView.image = nil
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension TeamsTableViewCell: ConfigurableCell{
    func configure(model: Team) {
        teamShortNameLabel.text = model.shortName ?? ""
        teamNameLabel.text = model.name ?? ""
        if let logo = model.crestURL , let logoURL = URL(string: logo) {
            teamImageView.kf.indicatorType = .activity
            teamImageView.kf.setImage(with: logoURL, options: [.processor(SVGImgProcessor())])
        }
        
    }
}
