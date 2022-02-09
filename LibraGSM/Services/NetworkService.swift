//
//  NetworkService.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 09.02.2022.
//

import Foundation
protocol NetworkServiceProtocol {
    func getListTrucks(completion: @escaping (Result<[Truck], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getListTrucks(completion: @escaping (Result<[Truck], Error>) -> Void) {
        let urlString = "http://109.87.56.237:7777/t"
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("ERROR")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                do {
                    let trucks = try JSONDecoder().decode(Root.self, from: data)
                  completion(.success(trucks.trucks))
                  print(trucks.trucks)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
