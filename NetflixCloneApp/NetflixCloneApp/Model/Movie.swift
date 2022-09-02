
import SwiftUI

struct Movie: Decodable {
    let results: [Movies]
}

struct Movies: Identifiable, Decodable {
    let id: Int
    let title: String
    let overview: String?
    let poster_path: String
    let popularity: Float
}
