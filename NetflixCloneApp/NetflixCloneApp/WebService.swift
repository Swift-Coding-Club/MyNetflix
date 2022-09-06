import Foundation
import Combine

//enum HTTPError: LocalizedError {
//    case statusCode
//    case post
//}
//
//struct WebService {
//
//    private var decoder: JSONDecoder = {
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        return decoder
//    }()
//
//    private var session: URLSession = {
//        let config = URLSessionConfiguration.default
//        config.urlCache = URLCache.shared
//        config.waitsForConnectivity = true
//        return URLSession(configuration: config, delegate: nil, delegateQueue: nil)
//    }()
//
//    private func createPublisher<T: Codable>(for url: URL) -> AnyPublisher<T, Error> {
//        print("Publisher URL: \(url)")
//        return session.dataTaskPublisher(for: url)
//            .tryMap { output in
//                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
//                    print("Response: \(output.response)")
//
//                    do {
//                        let ss = try self.decoder.decode(Response.self, from: output.data)
//                        print("ss:  \(ss)")
//                    } catch {
//                        print(error)
//                    }
//                    throw HTTPError.statusCode
//                }
//
//                return output.data
//            }
//            .decode(type: T.self, decoder: decoder)
//            .eraseToAnyPublisher()
//    }
//
//    func getMovieDetail(movieId: Int) -> AnyPublisher<Movie, Error> {
//        createPublisher(for: TMDBClient.Endpoints.movieDetail(movieId).url)
//    }
//
//}
