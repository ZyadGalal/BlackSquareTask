//
//  TeamsModel.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation
import RealmSwift

// MARK: - TeamsModel
class TeamsModel: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var count: Int = 0
    @objc dynamic var competition: TeamCompetition?
    var teams = List<Team>()
    var message: String = ""
    enum CodingKeys: String, CodingKey {
        case id, count,competition,teams,message
    }
    override class func primaryKey() -> String? {
        return "id"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decodeIfPresent(Int.self, forKey: .count) ?? 0
        let teamsList = try container.decodeIfPresent([Team].self, forKey: .teams) ?? []
        self.teams.append(objectsIn: teamsList)
        self.competition = try container.decodeIfPresent(TeamCompetition.self, forKey: .competition) ?? nil
        self.message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""

    }
}

// MARK: - Competition
class TeamCompetition: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var area: Area?
    @objc dynamic var name: String?
    enum CodingKeys: String, CodingKey {
        case id, name,area
    }
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Team
class Team: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var area: Area?
    @objc dynamic var name, shortName: String?
    @objc dynamic var crestURL: String?
    @objc dynamic var address, phone: String?
    @objc dynamic var website: String?
    @objc dynamic var email: String?

    enum CodingKeys: String, CodingKey {
        case id, area, name, shortName
        case crestURL = "crestUrl"
        case address, phone, website, email
    }
    override class func primaryKey() -> String? {
        return "id"
    }
}

