//
//  ListingDetailViewController.swift
//  99GroupTask
//
//  Created by Muhammad Aditya on 05/11/24.
//

import UIKit
import MapKit

class ListingDetailViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var areaSizeLabel: UILabel!
    @IBOutlet weak var bathroomsLabel: UILabel!
    @IBOutlet weak var bedroomsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pricePerSqftLabel: UILabel!
    @IBOutlet weak var floorLevelLabel: UILabel!
    @IBOutlet weak var furnishingLabel: UILabel!
    @IBOutlet weak var facingLabel: UILabel!
    @IBOutlet weak var overlookingViewLabel: UILabel!
    @IBOutlet weak var builtYearLabel: UILabel!
    @IBOutlet weak var tenureLabel: UILabel!
    @IBOutlet weak var propertyTypeLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!

    // Variable to hold the listing ID
    var listingId: Int?
    var propertyCoordinate: CLLocationCoordinate2D?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ensure that listingId is not nil before fetching data
        guard let listingId = listingId else { return }
        
        // Fetch listing details
        NetworkManager.shared.fetchListingDetail(for: listingId) { [weak self] detail in
            guard let self = self, let detail = detail else { return }
            DispatchQueue.main.async {
                self.updateUI(with: detail)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }

//UI Update
    private func updateUI(with detail: ListingDetail) {
        // Update labels with data from the listing detail
        projectNameLabel.text = detail.projectName
        titleLabel.text = detail.address.title
        subtitleLabel.text = detail.address.subtitle
        descriptionLabel.text = detail.description
        areaSizeLabel.text = "\(detail.attributes.areaSize) sqft"
        bathroomsLabel.text = "\(detail.attributes.bathrooms) Baths"
        bedroomsLabel.text = "\(detail.attributes.bedrooms) Beds"
        priceLabel.text = "$\(detail.attributes.price)"
        
        // Set the coordinate for map view
        propertyCoordinate = CLLocationCoordinate2D(
            latitude: detail.address.mapCoordinates.lat,
            longitude: detail.address.mapCoordinates.lng
        )
        
        // Map specific `propertyDetails` entries to their corresponding labels
        for property_details in detail.propertyDetails {
            switch property_details.label {
            case "Price/sqft":
                pricePerSqftLabel.text = property_details.text
            case "Floor Level":
                floorLevelLabel.text = property_details.text
            case "Facing":
                facingLabel.text = property_details.text
            case "Built year":
                builtYearLabel.text = property_details.text
            case "Tenure":
                tenureLabel.text = property_details.text
            case "Property type":
                propertyTypeLabel.text = property_details.text
            case "Last updated":
                lastUpdatedLabel.text = property_details.text
            default:
                break
            }
        }
        
        // Load the image asynchronously
        loadImage(from: detail.photo)
    }

    // Helper function for loading images asynchronously
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(named: "placeholder") // Use a placeholder if necessary
                }
            }
        }
    }
    
    // MARK: - Actions

    // Option 1: Open the property location in Apple Maps
    private func openInAppleMaps(coordinate: CLLocationCoordinate2D, name: String?) {
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    
    // Option 2: Prepare for segue to in-app MapViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMapSegue" {
            if let mapVC = segue.destination as? MapViewController {
                mapVC.propertyCoordinate = propertyCoordinate
                mapVC.propertyName = projectNameLabel.text
            }
        }
    }
}
