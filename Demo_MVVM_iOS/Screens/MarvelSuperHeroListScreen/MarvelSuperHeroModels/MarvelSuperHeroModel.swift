//
//  MarvelSuperHeroModel.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
struct MarvelSuperHeroModel: Codable ,Equatable{
    var bio: String?
    var createdby: String?
    var firstappearance: String?
    var imageurl: String?
    var name: String?
    var publisher: String?
    var realname: String?
    var team: String?
    
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
    
    init(bio:String,createdby:String,firstappearance:String,imageurl:String,name:String,publisher:String,realname:String,team:String){
        self.bio = bio
        self.createdby = createdby
        self.firstappearance = firstappearance
        self.imageurl = firstappearance
        self.name = firstappearance
        self.publisher = publisher
        self.realname = realname
        self.team = realname
    }
    
    init(from decoder: Decoder) throws {
        var values = try decoder.container(keyedBy: CodingKeys.self)
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
