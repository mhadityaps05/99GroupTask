//
//  SearchResultModel.swift
//  99GroupTask
//
//  Created by Muhammad Aditya on 05/11/24.
//

import Foundation

struct SearchResult: Decodable {
    struct Address: Decodable {
        let district: String
        let street_name: String
    }
    
    struct Attributes: Decodable {
        let area_size: Int
        let bathrooms: Int
        let bedrooms: Int
        let price: Int
    }
    
    let address: Address
    let attributes: Attributes
    let category: String
    let completed_at: String
    let id: Int
    let photo: String
    let project_name: String
    let tenure: Int
}
