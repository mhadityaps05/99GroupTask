import Foundation

// Main Listing Detail Model
struct ListingDetail: Codable {
    let address: Address
    let attributes: Attributes
    let description: String
    let id: Int
    let photo: String
    let projectName: String
    let propertyDetails: [PropertyDetail]
    
    enum CodingKeys: String, CodingKey {
        case address, attributes, description, id, photo
        case projectName = "project_name"
        case propertyDetails = "property_details"
    }
}

// Address Model
struct Address: Codable {
    let mapCoordinates: MapCoordinates
    let subtitle: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case mapCoordinates = "map_coordinates"
        case subtitle, title
    }
}

// Map Coordinates Model
struct MapCoordinates: Codable {
    let lat: Double
    let lng: Double
}

// Attributes Model
struct Attributes: Codable {
    let areaSize: Int
    let bathrooms: Int
    let bedrooms: Int
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case areaSize = "area_size"
        case bathrooms, bedrooms, price
    }
}

//Property Detail Model
struct PropertyDetail: Codable {
    let label: String
    let text: String
}
