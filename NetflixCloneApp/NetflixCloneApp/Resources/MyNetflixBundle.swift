
import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "API", ofType: "plist") else { return "" }
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["API_KEY"] as? String else { fatalError("MovieInfo.plist의 API Key를 설정해주세요.")}
        
        return key
    }
}
