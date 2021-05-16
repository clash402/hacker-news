//
//  NetworkManager.swift
//  hacker-news
//
//  Created by Josh Courtney on 5/3/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let data = data else { return }
                let decoder = JSONDecoder()
                
                do {
                    let results = try decoder.decode(Results.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch {
                    print(error)
                }
            }
        }
        
        task.resume()
    }
    
}
