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
        NetworkManager.shared.get(.SEARCH_ENDPOINT, method: .post, request: requestData, responseType: OnlineMusicSearch.self) { data, err in
//            let id = data?.results?.data?.first?.contents?.first?.id
            let id = data?.results?.data?.first?.contents?.first?.id
            dump(data)
            self.fetchLyrics(id: id ?? .emptyString) { lyricData, err in
                completion(lyricData, err)
                
            }
        }
    }
    
    internal func fetchLyrics(id: String, completion: @escaping ((OnlineLyricSearch?, Error?) -> Void)) {
        let requestData = LyricFetcherRequest(id: id)
        NetworkManager.shared.get(.LYRICS_ENDPOINT, method: .post, request: requestData, responseType: OnlineLyricSearch.self) { data, err in
            completion(data, err)
        }
    }
}
