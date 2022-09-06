
import SwiftUI
import Combine

struct Contants {
    static let API_KEY = Bundle.main.apiKey
    static let URL = "https://api.themoviedb.org"
}

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie]?
    
    private var cancellables = Set<AnyCancellable>()
    
    private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func getTrandigMovies() {
        guard let url = URL(string: "\(Contants.URL)/3/trending/movie/day?api_key=\(Contants.API_KEY)") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: MovieResults.self, decoder: JSONDecoder())
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
            } receiveValue: { value in
                self.movies = value
            }
            .store(in: &cancellables)
            
    }
}


