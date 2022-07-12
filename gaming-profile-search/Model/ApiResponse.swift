//
//  ApiResponse.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 11/07/2022.
//

import Foundation

struct PlayerResponse: Codable, Identifiable {
    var id: String
    var username: String
    var avatar: String
    var raw_id: String?
    // var meta: ProfileType
}

struct DataPlayer: Codable {
    let player: PlayerResponse?
}

struct ApiResponse: Codable {
    let code: String
    let message: String
    var data: DataPlayer?
    let success: Bool
    let error: Bool?
}
