//
//  NetworkManager.swift
//  99GroupTask
//
//  Created by Muhammad Aditya on 05/11/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://ninetyninedotco-b7299.asia-southeast1.firebasedatabase.app"
    
    // Function to fetch search results
    func fetchSearchResults(completion: @escaping ([SearchResult]?) -> Void) {
        let urlString = "\(baseURL)/listings.json"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch search results: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            let decoder = JSONDecoder()
            do {
                let searchResults = try decoder.decode([SearchResult].self, from: data)
                completion(searchResults)
            } catch {
                print("Failed to decode search results: \(error)")
                completion(nil)
            }
        }.resume()
    }

    // Function to fetch listing details with a dynamic listing ID
    func fetchListingDetail(for listingId: Int, completion: @escaping (ListingDetail?) -> Void) {
        let urlString = "\(baseURL)/details/\(listingId).json"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch listing detail: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            let decoder = JSONDecoder()
            do {
                let listingDetail = try decoder.decode(ListingDetail.self, from: data)
                completion(listingDetail)
            } catch {
                print("Failed to decode listing detail: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
