//
//  NetworkingController.swift
//  Forecast_Codable
//
//  Created by Karl Pfister on 2/6/22.
//

import Foundation

class NetworkingContoller {
    private static let baseURLString = "https://api.weatherbit.io"
    
    static func fetchDays(completion: @escaping (TopLevelDictionary?) -> Void) {
        guard let baseURL = URL(string:baseURLString) else {return}


        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path = "/v2.0/forecast/daily"
        
        let apiQuery = URLQueryItem(name: "key", value: "db82f0a868b04c1cac184985892756af")
        let cityQuery = URLQueryItem(name: "city", value:"Salt Lake")
        let unitsQuery = URLQueryItem(name: "units", value: "I")
        urlComponents?.queryItems = [apiQuery,cityQuery,unitsQuery]
        
        guard let finalURL = urlComponents?.url else {return}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { dayData, _, error in
            if let error = error {
                print("There was an error fetching the data. The url is \(finalURL), the error is \(error.localizedDescription)")
                completion(nil)
            }
            
            guard let data = dayData else {
                print("There was an error recieveing the data!")
                completion(nil)
                return
            }
            
            do {
                let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                completion(topLevelDictionary)
            } catch {
                print("Error in Do/Try/Catch: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
