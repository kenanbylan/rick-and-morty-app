
import Foundation

enum ErrorTypes: String, Error {
    
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}


class NetworkHelper {
    
    static let shared = NetworkHelper()
    private let baseURL = "https://rickandmortyapi.com"
    
    //https://rickandmortyapi.com/api/location
    
    func requestUrl(url: String) -> String {
        baseURL + "/api\(url)"
    }
    
  
}
