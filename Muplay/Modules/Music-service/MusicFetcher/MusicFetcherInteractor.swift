//
//  MusicFetcherInteractor.swift
//  Muplay
//
//  Created by Ariesta APP on 05/05/24.
//

import Foundation

protocol MusicFetcherUseCase {
    func fetchSong(title: String, completion: @escaping (OnlineLyricSearch?, Error?) -> Void)
    func fetchLyrics(id: String, completion: @escaping ((OnlineLyricSearch?, Error?) -> Void))
}

class MusicFetcherInteractor: MusicFetcherUseCase {
    static let shared = MusicFetcherInteractor()
    func fetchSong(title: String, completion: @escaping (OnlineLyricSearch?, Error?) -> Void) {
        let requestData = MusicFetcherRequest(
            q: title,
            shelf: "song"
        )
        NetworkManager.shared.get(.SEARCH_ENDPOINT, method: .get, request: requestData, responseType: OnlineMusicSearch.self) { data, err in
            let id = data?.result?.first?.videoID
            if err != nil {
                completion(nil, err)
            } else {
                self.fetchLyrics(id: id ?? .emptyString) { lyricData, err in
                    completion(lyricData, err)
                }
            }
        }
    }
    
    internal func fetchLyrics(id: String, completion: @escaping ((OnlineLyricSearch?, Error?) -> Void)) {
        let requestData = LyricFetcherRequest(id: id)
        print("IDHERE:\(id)")
        NetworkManager.shared.get(.LYRICS_ENDPOINT, method: .get, request: requestData, responseType: OnlineLyricSearch.self) { data, err in
            if err != nil {
                completion(nil, err)
            } else {
                completion(data, err)
            }
        }
    }
}
