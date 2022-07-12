//
//  Profiles.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 11/07/2022.
//

import Foundation

struct MinecraftName: Codable {
    var name: String
    var changedToAt: Int?
}

struct MinecraftProfile: Codable {
    var name_history: [MinecraftName]
}

struct SteamProfile: Codable {
    var steam2id: String
    var steam2id_new: String
    var steam3id: String
    var steam64id: String
    var steamid: String
    var communityvisibilitystate: Int
    var profilestate: Int
    var personaname: String
    var commentpermission: Int
    var profileurl: String
    var avatar: String
    var avatarmedium: String
    var avatarfull: String
    var avatarhash: String
    var personastate: Int
    var realname: String
    var primaryclanid: String
    var timecreated: Int
    var personastateflags: Int
    var loccountrycode: String
}

struct XboxProfile: Codable {
    var gamerscore: String
    var accountTier: String
    var xboxOneRep: String
    var preferredColor: String
    var realName: String
    var bio: String
    var tenureLevel: String
    var watermarks: String
    var location: String
    var showUserAsAvatar: String
}

enum ProfileType: Codable {
    case minecraft (MinecraftProfile)
    case steam (SteamProfile)
    case xbox (XboxProfile)
}
