//
//  DataLoader.swift
//  99GroupTask
//
//  Created by Muhammad Aditya on 05/11/24.
//

import Foundation

func loadSearchResults() -> [SearchResult]? {
    guard let url = Bundle.main.url(forResource: "searchResults", withExtension: "json"),
          let data = try? Data(contentsOf: url) else { return nil }
    let decoder = JSONDecoder()
    return try? decoder.decode([SearchResult].self, from: data)
}

func loadListingDetail() -> ListingDetail? {
    guard let url = Bundle.main.url(forResource: "listingDetail", withExtension: "json"),
          let data = try? Data(contentsOf: url) else { return nil }
    let decoder = JSONDecoder()
    return try? decoder.decode(ListingDetail.self, from: data)
}

