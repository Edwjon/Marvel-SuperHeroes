//
//  Heroes.swift
//  Marvel SuperHeroes
//
//  Created by Edward Pizzurro Fortun on 9/29/20.
//  Copyright © 2020 Edwjon. All rights reserved.
//

import Foundation

struct Data: Decodable {
    var data: Heroes
}

struct Heroes: Decodable {
    var results:[HeroesDetail]
}

struct HeroesDetail: Decodable {
    var name: String
    var description: String
    var thumbnail: HeroesImage
}

struct HeroesImage: Decodable {
    var path: String
    var `extension`: String
}



struct HeroesRequest {
    
    let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=43fe613b9404a4f9aecadb58fa38e9b2&hash=9e71e6d26e89c106d0e8f56fc5d90ca4")
    
    func getHeroes(completion: @escaping(Result<[HeroesDetail], Error>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let heroesResponse = try decoder.decode(Data.self, from: data!)
                let heroes = heroesResponse.data.results
                completion(.success(heroes))
                
            } catch {
                completion(.failure(err!))
            }
        }
        
        dataTask.resume()
    }
}
