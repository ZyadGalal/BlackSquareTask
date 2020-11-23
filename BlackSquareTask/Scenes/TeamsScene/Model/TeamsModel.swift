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
    let filters: Filters?
    let competition: TeamCompetition?
    let season: Season?
    let teams: [Team]?
}

// MARK: - Competition
struct TeamCompetition: Codable {
    let id: Int?
    let area: TeamArea?
    let name, code, plan: String?
    let lastUpdated: Date?
}

// MARK: - Area
struct TeamArea: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Season
struct Season: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
    let winner: Winner?
}

// MARK: - Team
struct Team: Codable {
    let id: Int?
    let area: TeamArea?
    let name, shortName, tla: String?
    let crestURL: String?
    let address, phone: String?
    let website: String?
    let email: String?
    let founded: Int?
    let clubColors: String?
    let venue: String?
    let lastUpdated: Date?

    enum CodingKeys: String, CodingKey {
        case id, area, name, shortName, tla
        case crestURL = "crestUrl"
        case address, phone, website, email, founded, clubColors, venue, lastUpdated
    }
}

