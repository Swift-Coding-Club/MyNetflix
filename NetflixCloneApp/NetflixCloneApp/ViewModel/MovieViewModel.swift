
import SwiftUI
import Combine

struct API {
    static let API_KEY = Bundle.main.apiKey
    static let URL = "https://api.themoviedb.org"
}

struct Media {
    static let movie = "movie"
    static let tv = "tv"
}

enum NetworError: Error {
    case invalidRequest
    case unknownError(message: String)
}

class MovieViewModel: ObservableObject {
    @Published var contents: [Contents]?
    @Published var thumnail: UIImage?
    
    private var cancellables = Set<AnyCancellable>()
    
    func getTrendigContents(media_type: String) {
        guard let url = URL(string: "\(API.URL)/3/trending/\(media_type)/day?api_key=\(API.API_KEY)") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: ContentsResults.self, decoder: JSONDecoder())
            .map{ $0.results! }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { contents in
                self.contents = contents
            }
            .store(in: &cancellables)
            
    }
    
    func getUpcomingContents() {
        guard let url = URL(string: "\(API.URL)/3/movie/upcoming??api_key=\(API.API_KEY)&language==en-US&page=1") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: ContentsResults.self, decoder: JSONDecoder())
            .map{ $0.results! }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { contents in
                self.contents = contents
            }
            .store(in: &cancellables)
    }
    
//    func fecthData(_ section: Int) {
//        switch(section) {
//        case Sections.TrendingMovie.rawValue:
//        case Sections.TrendingTv.rawValue:
//        case Sections.Upcoming.rawValue:
//        default: return
//        }
//    }
    
//    func renderingImage(poster_path: String) {
//        let url = URL(string:"https://image.tmdb.org/t/p/w500\(poster_path)")
//
//        return URLSession.shared.dataTaskPublisher(for: url!)
//            .map { UIImage(data: $0.data) }
//            .receive(on: DispatchQueue.main)
//            .mapError{ $0 as Error }
//            .eraseToAnyPublisher()
//            .sink { result in
//                switch result {
//                case .failure(let error):
//                    print(error)
//                case .finished:
//                    print("success")
//                }
//            } receiveValue: { [weak self] data in
//                DispatchQueue.main.async {
//                    self?.thumnail = UIImage(data: data)
//                }
//            }
//            .store(in: &cancellables)
//    }
        
        
        
    
    
}


