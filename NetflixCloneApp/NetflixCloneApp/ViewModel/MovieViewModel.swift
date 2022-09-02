
import SwiftUI

struct Contants {
    static let API_KEY = "1eb97a2f3b0acf1044d4c836dc254cf7"
    static let URL = "https://api.themoviedb.org"
}

class MovieViewModel: ObservableObject {
    @Published var movies: [Movies]?
    
    func getTrandigMovies() {
        let url = URL(string: "\(Contants.URL)/3/trending/movie/day?api_key=\(Contants.API_KEY)")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let movie = try JSONDecoder().decode(Movie.self, from: data)
                    self.movies = movie.results
                    
                } catch (let error) {
                    print(error)
                    return
                }
            } else {
                print("error")
                return
            }
        }.resume()
        
    }
}


