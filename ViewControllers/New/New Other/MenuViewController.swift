import UIKit

enum MenuType: Int { // change cases to actual menupoints!
    case profile
    case partners
    case privacyPol
    case logout
}

class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) {
            print("Dismissing: \(menuType)")
        }
    }
   
//CONTINUE
    
}
