//
//  TeamsModel.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import Foundation

// MARK: - TeamsModel
struct TeamsModel: Codable {
    let count: Int?
    let competition: TeamCompetition?
    let teams: [Team]?
    let errorCode: Int?
    let message: String?
}

// MARK: - Competition
struct TeamCompetition: Codable {
    let id: Int?
    let area: TeamArea?
    let name: String?
}

// MARK: - Area
struct TeamArea: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Team
struct Team: Codable {
    let id: Int?
    let area: TeamArea?
    let name, shortName: String?
    let crestURL: String?
    let address, phone: String?
    let website: String?
    let email: String?

    enum CodingKeys: String, CodingKey {
        case id, area, name, shortName
        case crestURL = "crestUrl"
        case address, phone, website, email
    }
}

