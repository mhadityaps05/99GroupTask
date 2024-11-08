import UIKit

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var searchResults: [SearchResult] = []
    var selectedListingId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the table view delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register the custom cell XIB
        let nib = UINib(nibName: "SearchResultTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SearchResultCell")
        
        tableView.backgroundColor = UIColor.systemGroupedBackground
        
        // Fetch search results from the network
        NetworkManager.shared.fetchSearchResults { [weak self] results in
            guard let self = self, let results = results else { return }
            DispatchQueue.main.async {
                self.searchResults = results
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as! SearchResultTableViewCell
        let result = searchResults[indexPath.row]
        cell.configure(with: result)
        
        // Add shadow and rounded corners directly in the view controller
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450 // Adjust the height as needed
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Set the selected listing ID
        selectedListingId = searchResults[indexPath.row].id
        
        // Perform the modal segue programmatically
        performSegue(withIdentifier: "showListingDetailSegue", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showListingDetailSegue" {
            // Pass the selected listing ID to ListingDetailViewController
            if let destinationVC = segue.destination as? ListingDetailViewController {
                destinationVC.listingId = selectedListingId
            }
        }
    }
}
