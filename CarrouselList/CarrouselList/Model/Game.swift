//
//  Game.swift
//  CarrouselList
//
//  Created by 이현호 on 2021/07/15.
//

import Foundation

// https://www.freetogame.com/api-doc
struct Game: Decodable, Identifiable {
    let id: Int
    let title: String
    let thumbnail: String
    let shortDescription: String
    let gameUrl: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let releaseDate: String
    let freetogameProfileUrl: String
    var isLiked: Bool? = false
    var rating: Int! = 0
}

struct MockData {
    
    static let sampleGame1 = Game(id: 1,
                                 title: "Dauntless1",
                                 thumbnail: "https://www.freetogame.com/g/1/thumbnail.jpg",
                                 shortDescription: "A free-to-play, co-op action RPG with gameplay similar to Monster Hunter.",
                                 gameUrl: "https://www.freetogame.com/open/dauntless",
                                 genre: "MMORPG",
                                 platform: "PC (Windows)",
                                 publisher: "Phoenix Labs",
                                 developer: "Phoenix Labs, Iron Galaxy",
                                 releaseDate: "2019-05-21",
                                 freetogameProfileUrl: "https://www.freetogame.com/dauntless")
    static let sampleGame2 = Game(id: 2,
                                 title: "Dauntless2",
                                 thumbnail: "https://www.freetogame.com/g/1/thumbnail.jpg",
                                 shortDescription: "A free-to-play, co-op action RPG with gameplay similar to Monster Hunter.",
                                 gameUrl: "https://www.freetogame.com/open/dauntless",
                                 genre: "MMORPG",
                                 platform: "PC (Windows)",
                                 publisher: "Phoenix Labs",
                                 developer: "Phoenix Labs, Iron Galaxy",
                                 releaseDate: "2019-05-21",
                                 freetogameProfileUrl: "https://www.freetogame.com/dauntless")
    static let sampleGame3 = Game(id: 3,
                                 title: "Dauntless3",
                                 thumbnail: "https://www.freetogame.com/g/1/thumbnail.jpg",
                                 shortDescription: "A free-to-play, co-op action RPG with gameplay similar to Monster Hunter.",
                                 gameUrl: "https://www.freetogame.com/open/dauntless",
                                 genre: "MMORPG",
                                 platform: "PC (Windows)",
                                 publisher: "Phoenix Labs",
                                 developer: "Phoenix Labs, Iron Galaxy",
                                 releaseDate: "2019-05-21",
                                 freetogameProfileUrl: "https://www.freetogame.com/dauntless")
    static let sampleGame4 = Game(id: 4,
                                 title: "Dauntless4",
                                 thumbnail: "https://www.freetogame.com/g/1/thumbnail.jpg",
                                 shortDescription: "A free-to-play, co-op action RPG with gameplay similar to Monster Hunter.",
                                 gameUrl: "https://www.freetogame.com/open/dauntless",
                                 genre: "MMORPG",
                                 platform: "PC (Windows)",
                                 publisher: "Phoenix Labs",
                                 developer: "Phoenix Labs, Iron Galaxy",
                                 releaseDate: "2019-05-21",
                                 freetogameProfileUrl: "https://www.freetogame.com/dauntless")
    static let sampleGames = [sampleGame1, sampleGame2, sampleGame3, sampleGame4]
}

