import SwiftUI


struct ContentsResults: Decodable {
    let page: Int?
    let results: [Contents]?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        results = try values.decodeIfPresent([Contents].self, forKey: .results)
    }
}

struct Contents: Identifiable, Decodable {
    let id: Int?
    let backdrop_path: String?
    let title: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let media_type: String?
    let popularity: Float?
    let release_date: String?
    let vote_average: Float?
}
