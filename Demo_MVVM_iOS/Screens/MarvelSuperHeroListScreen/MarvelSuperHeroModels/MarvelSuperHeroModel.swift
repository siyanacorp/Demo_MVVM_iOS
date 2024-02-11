//
//  MarvelSuperHeroModel.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
struct MarvelSuperHeroModel: Codable {
    let bio: String?
    let createdby: String?
    let firstappearance: String?
    let imageurl: String?
    let name: String?
    let publisher: String?
    let realname: String?
    let team: String?
    
    enum CodingKeys: String, CodingKey {
        case bio = "bio"
        case createdby = "createdby"
        case firstappearance = "firstappearance"
        case imageurl = "imageurl"
        case name = "name"
        case publisher = "publisher"
        case realname = "realname"
        case team = "team"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
        createdby = try values.decodeIfPresent(String.self, forKey: .createdby)
        firstappearance = try values.decodeIfPresent(String.self, forKey: .firstappearance)
        imageurl = try values.decodeIfPresent(String.self, forKey: .imageurl)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        publisher = try values.decodeIfPresent(String.self, forKey: .publisher)
        realname = try values.decodeIfPresent(String.self, forKey: .realname)
        team = try values.decodeIfPresent(String.self, forKey: .team)
    }
}
