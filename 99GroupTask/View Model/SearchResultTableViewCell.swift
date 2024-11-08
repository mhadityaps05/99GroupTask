import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var streetnameLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var tenureLabel: UILabel!
    @IBOutlet weak var bedroomsLabel: UILabel!
    @IBOutlet weak var bathroomsLabel: UILabel!
    @IBOutlet weak var areasizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    private let paddingView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 30
               photoImageView.clipsToBounds = true
        
        // Configure rounded corners and shadow
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    func configure(with result: SearchResult) {
        // Configure cell content
        projectNameLabel.text = result.project_name
        streetnameLabel.text = result.address.street_name
        priceLabel.text = "$\(result.attributes.price)/mo"
        districtLabel.text = result.address.district
        categoryLabel.text = result.category
        yearLabel.text = result.completed_at
        tenureLabel.text = "\(result.tenure)yrs"
        bedroomsLabel.text = "\(result.attributes.bedrooms) Beds"
        bathroomsLabel.text = "\(result.attributes.bathrooms) Baths"
        areasizeLabel.text = "\(result.attributes.area_size) sqft"

        // Load the image asynchronously
        if let url = URL(string: result.photo) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.photoImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
