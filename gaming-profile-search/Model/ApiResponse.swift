//
//  ApiResponse.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 11/07/2022.
//

import Foundation

struct PlayerResponse<T : Codable> : Identifiable, Codable {
    var id : String
    var username : String
    var avatar : String
    var raw_id : Optional<String>
    var meta : Optional<T>
}

struct DataPlayer<T : Codable> : Codable {
    let player : PlayerResponse<T>
}

struct ApiResponse<T : Codable> : Codable {
    let code : String
    let message : String
    var data: DataPlayer<T>
    let success : Bool
    let error : Optional<Bool>
}
