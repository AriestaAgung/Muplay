//
//  NetworkManager.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Alamofire

enum Endpoint: String {
    case SEARCH_ENDPOINT = "search"
    case LYRICS_ENDPOINT = "lyric"
    
}

class NetworkManager {
    static let shared = NetworkManager()
    private let BASE_URL = "https://youtube-music4.p.rapidapi.com/"
    
    func get<T: Codable, U: Codable>(_ endpoint: Endpoint, method: String = "GET", request: T, responseType: U.Type, completion: @escaping ((U?, Error?) -> Void)) {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "content-type": "application/json",
            "X-RapidAPI-Key": "f831170212msh49d739f9be2fb5ep16f174jsne4a8297b94b7",
            "X-RapidAPI-Host": "youtube-music4.p.rapidapi.com"
        ]
        
        let session = URLSession(configuration: config)
        guard let url = URL(string: BASE_URL + endpoint.rawValue) else { return }
        print("PRINTURL: \(url.absoluteString)")
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method
            
            urlRequest.httpBody = try JSONEncoder().encode(request)
            session.dataTask(with: urlRequest) { (data, response, error) in
                DispatchQueue.main.async {
                    guard let data = data else {
                        completion(nil, error)
                        return
                    }
                    do {
                        dump(response as? HTTPURLResponse)
                        let decoder = try JSONDecoder().decode(responseType, from: data)
                        completion(decoder, error)
                    } catch (let e) {
                        print(e.localizedDescription)
                        completion(nil, e)
                    }
                }
            }.resume()
        } catch let (e) {
            print(e.localizedDescription)
        }
    }
}
