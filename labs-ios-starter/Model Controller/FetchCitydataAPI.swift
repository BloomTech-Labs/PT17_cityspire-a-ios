//
//  FetchCitydataAPI.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/14/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class FetchCitydataAPI {
    
    ///Base URL
    let baseURL = URL(string: "http://cityspire-a.eba-tgambvt2.us-east-1.elasticbeanstalk.com/api")!
    
    ///create shared instance
    let shared : NetworkFetchLoader
    init(shared: NetworkFetchLoader = URLSession.shared) {
        self.shared = shared
    }
    //MARK: - Helpers
    
    /// Helper for Response Checking Logic
    public func checkFetchResponse(for taskDescription: String, _ data: Data?, _ response: URLResponse?, _ error: Error?, completion: @escaping (Result<Data, NetworkErrors>) -> Void) {
        if let error = error {
            NSLog("\(taskDescription) failed with error: \(error)")
            completion(.failure(.otherError))
            return
        }
        if let response = response as? HTTPURLResponse,
           !(200...210 ~= response.statusCode) {
            NSLog("\(taskDescription) failed response - \(response)")
            completion(.failure(.failedResponse))
            return
        }
        guard let data = data,
              !data.isEmpty else {
            NSLog("Data was not received from \(taskDescription)")
            completion(.failure(.noResponse))
            return
        }
        /// success
        completion(.success(data))
    }
    
    //MARK: - Post Request
    func postRequestWithCity(url: URL, urlPathComponent: String, city: City) -> URLRequest? {
        let urlPath = url.appendingPathComponent(urlPathComponent)
        var request = URLRequest(url: urlPath)
        request.httpMethod = "POST"
        let parameters = PostParameters(city: city.cityName, state: city.cityState)
        guard let jsonData = try? JSONEncoder().encode(parameters) else { return nil }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        return request
    }
    
    //MARK: - Fetch Weather Data
    func getWeatherData(cityName: City, completion: @escaping (Weather?, Error?) -> Void) {
        
        guard let url = URL(string: "http://cityspire-a.eba-tgambvt2.us-east-1.elasticbeanstalk.com/api/temperature") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let body = PostParameters(city: cityName.cityName, state: cityName.cityState)
        guard let jsonData = try? JSONEncoder().encode(body) else { return }
        request.httpBody = jsonData
        
        shared.dataRequest(with: request) { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            } else if let data = data {
                do {
                    let cityWeatherData = try JSONDecoder().decode(Weather.self, from: data)
                    completion(cityWeatherData, nil)
                    print("City data in DO:", cityWeatherData)
                } catch {
                    print("Error fetching data: ", error)
                    completion(nil,error)
                    
                }
            }
        }
        
    }
    
    
    //MARK: - Fetch City Data
    func getData(city: City, completion: @escaping (City) -> Void) {
        let path = "get_data"
        guard let request = postRequestWithCity(url: baseURL, urlPathComponent: path, city: city) else {
            completion(city)
            return
        }
        shared.dataRequest(with: request) { data, response, error in
            self.checkFetchResponse(for: "getCityData", data, response, error) { result in
                switch result {
                    case .success(let data):
                        do {
                            var newCityData = try JSONDecoder().decode(City.self, from: data)
                            newCityData.cityName = city.cityName
                            newCityData.cityState = city.cityState
                            completion(newCityData)
                            print("NEW CITY DATA:", newCityData)
                        } catch {
                            NSLog("Error decoding city data: \(error)")
                            completion(city)
                        }
                    default:
                        completion(city)
                    //                    self.getWalkability(city: city) { city in
                    //                        completion(city)
                    //                    }
                }
            }
        }
    }
    
    ///get city data - SAL
    func getCityData(cityName: City, completion: @escaping (City?, Error?) -> Void) {
        
        guard let url = URL(string: "http://cityspire-a.eba-tgambvt2.us-east-1.elasticbeanstalk.com/api/get_data") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let body = PostParameters(city: cityName.cityName, state: cityName.cityState)
        guard let jsonData = try? JSONEncoder().encode(body) else { return }
        request.httpBody = jsonData
        
        shared.dataRequest(with: request) { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            } else if let data = data {
                do {
                    let cityData = try JSONDecoder().decode(City.self, from: data)
                    completion(cityData, nil)
                    print("City data in DO:", cityData)
                } catch {
                    print("Error fetching data: ", error)
                    completion(nil,error)
                    
                }
            }
            
        }
        
    }
    
    
}
