import SwiftUI
import Combine
import Foundation



class ImageLoader: ObservableObject {
    @Published private(set) var image: UIImage?
    
    private var cancellable: AnyCancellable?
    
    
    func load(url: String) {
        let url = URL(string:"https://image.tmdb.org/t/p/w500\(url)")
        
        cancellable = URLSession.shared
            .dataTaskPublisher(for: url!)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func stop() {
        cancellable?.cancel()
    }
    
    deinit {
        cancellable?.cancel()
    }
}

