//
//  NetworkManager.swift
//  CarouselList
//
//  Created by 이현호 on 2021/07/17.
//

import UIKit

enum NetworkError: Error {
    case invalidURL
    case serverError
    case invalidResponse
    case invalidData
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let gameURLString = "https://www.freetogame.com/api/games"
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getGames(completed: @escaping ([Game]?, String?) -> Void) {
        
        guard let url = URL(string: gameURLString) else {
            completed(nil, "url이 올바르지 않습니다")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(nil, "에러가 있습니다")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "응답이 올바르지 않습니다")
                return
            }
            
            guard let data = data else {
                completed(nil, "데이터가 올바르지 않습니다")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedResponse = try decoder.decode([Game].self, from: data)
                completed(decodedResponse, nil)
            } catch {
                completed(nil, "서버로 부터 응답이 올바르지 않습니다")
            }
            
        }
        
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
