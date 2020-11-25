//
//  CompetitionsModel.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation
import RealmSwift
// MARK: - CompetitionsModel
class CompetitionsModel: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var count: Int = 0
    var competitions = List<Competition>()
    private enum CodingKeys: String, CodingKey {
            case count ,competitions
    }
        
    public required convenience init(from decoder: Decoder) throws {
            self.init()
            let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int.self, forKey: .count)
        let competitionsList = try container.decodeIfPresent([Competition].self, forKey: .competitions) ?? []
        competitions.append(objectsIn: competitionsList)
            
        }
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Competition
class Competition: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var area: Area?
    @objc dynamic var name: String?
    @objc dynamic var currentSeason: CurrentSeason?

    enum CodingKeys: String, CodingKey {
        case id, area, name
        case  currentSeason
    }
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Area
class Area: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?

    enum CodingKeys: String, CodingKey {
        case id, name
    }
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - CurrentSeason
class CurrentSeason: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var startDate, endDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id, startDate, endDate
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}




