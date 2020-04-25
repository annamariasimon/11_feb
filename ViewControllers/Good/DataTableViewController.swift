//THIS WILL BE THE SHOP INFO

import UIKit

class DataTableViewController: UITableViewController {
    
    let data = DataLoader().ShopsData

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopcell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = data[indexPath.row].name

        return cell
    }

}
