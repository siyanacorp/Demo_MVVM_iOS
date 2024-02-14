//
//  GoodWeatherModel.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 14/02/24.
//

import Foundation
// MARK: - GoodWeatherModel
struct GoodWeatherModel: Codable {
    let current : GoodWeatherModelCurrent?
    let location : GoodWeatherModelLocation?
    
    enum CodingKeys: String, CodingKey {
        case current
        case location
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        current = try GoodWeatherModelCurrent(from: decoder)
        location = try GoodWeatherModelLocation(from: decoder)
    }
}

struct GoodWeatherModelLocation : Codable {
    let country : String?
    let lat : Float?
    let localtime : String?
    let localtimeEpoch : Int?
    let lon : Float?
    let name : String?
    let region : String?
    let tzId : String?
    
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case lat = "lat"
        case localtime = "localtime"
        case localtimeEpoch = "localtime_epoch"
        case lon = "lon"
        case name = "name"
        case region = "region"
        case tzId = "tz_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        lat = try values.decodeIfPresent(Float.self, forKey: .lat)
        localtime = try values.decodeIfPresent(String.self, forKey: .localtime)
        localtimeEpoch = try values.decodeIfPresent(Int.self, forKey: .localtimeEpoch)
        lon = try values.decodeIfPresent(Float.self, forKey: .lon)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        tzId = try values.decodeIfPresent(String.self, forKey: .tzId)
    }
}

struct GoodWeatherModelCurrent : Codable {
    
    let cloud : Int?
    let condition : GoodWeatherModelCondition?
    let feelslikeC : Float?
    let feelslikeF : Float?
    let gustKph : Float?
    let gustMph : Float?
    let humidity : Int?
    let isDay : Int?
    let lastUpdated : String?
    let lastUpdatedEpoch : Int?
    let precipIn : Float?
    let precipMm : Float?
    let pressureIn : Float?
    let pressureMb : Float?
    let tempC : Float?
    let tempF : Float?
    let uv : Float?
    let visKm : Float?
    let visMiles : Float?
    let windDegree : Int?
    let windDir : String?
    let windKph : Float?
    let windMph : Float?
    
    enum CodingKeys: String, CodingKey {
        case cloud = "cloud"
        case condition
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case gustKph = "gust_kph"
        case gustMph = "gust_mph"
        case humidity = "humidity"
        case isDay = "is_day"
        case lastUpdated = "last_updated"
        case lastUpdatedEpoch = "last_updated_epoch"
        case precipIn = "precip_in"
        case precipMm = "precip_mm"
        case pressureIn = "pressure_in"
        case pressureMb = "pressure_mb"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case uv = "uv"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case windKph = "wind_kph"
        case windMph = "wind_mph"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cloud = try values.decodeIfPresent(Int.self, forKey: .cloud)
        condition = try GoodWeatherModelCondition(from: decoder)
        feelslikeC = try values.decodeIfPresent(Float.self, forKey: .feelslikeC)
        feelslikeF = try values.decodeIfPresent(Float.self, forKey: .feelslikeF)
        gustKph = try values.decodeIfPresent(Float.self, forKey: .gustKph)
        gustMph = try values.decodeIfPresent(Float.self, forKey: .gustMph)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        isDay = try values.decodeIfPresent(Int.self, forKey: .isDay)
        lastUpdated = try values.decodeIfPresent(String.self, forKey: .lastUpdated)
        lastUpdatedEpoch = try values.decodeIfPresent(Int.self, forKey: .lastUpdatedEpoch)
        precipIn = try values.decodeIfPresent(Float.self, forKey: .precipIn)
        precipMm = try values.decodeIfPresent(Float.self, forKey: .precipMm)
        pressureIn = try values.decodeIfPresent(Float.self, forKey: .pressureIn)
        pressureMb = try values.decodeIfPresent(Float.self, forKey: .pressureMb)
        tempC = try values.decodeIfPresent(Float.self, forKey: .tempC)
        tempF = try values.decodeIfPresent(Float.self, forKey: .tempF)
        uv = try values.decodeIfPresent(Float.self, forKey: .uv)
        visKm = try values.decodeIfPresent(Float.self, forKey: .visKm)
        visMiles = try values.decodeIfPresent(Float.self, forKey: .visMiles)
        windDegree = try values.decodeIfPresent(Int.self, forKey: .windDegree)
        windDir = try values.decodeIfPresent(String.self, forKey: .windDir)
        windKph = try values.decodeIfPresent(Float.self, forKey: .windKph)
        windMph = try values.decodeIfPresent(Float.self, forKey: .windMph)
    }
}



struct GoodWeatherModelCondition : Codable {
    let code : Int?
    let icon : String?
    let text : String?
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case icon = "icon"
        case text = "text"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        text = try values.decodeIfPresent(String.self, forKey: .text)
    }
}
