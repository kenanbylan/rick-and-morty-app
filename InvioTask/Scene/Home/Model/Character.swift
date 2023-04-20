
struct CharacterResponse: Codable {
    let info: Info
    let results: [Character]
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}



struct CharacterResponseById : Codable {
    let results: [Character]
    
}


struct Character: Codable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: OriginLocation
    let location: OriginLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        
        
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
    }
}

struct OriginLocation : Codable {
    let name: String
    let url: String
}


struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }
}
