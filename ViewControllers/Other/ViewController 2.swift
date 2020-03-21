import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var shopOneLabel: UILabel!
    @IBOutlet weak var shopTwoLabel: UILabel!
    var shopOne: String = "GAP"
    var shopTwo: String = "TopShop"
    var dateOne: String = "10 February, 2020"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shopOneLabel.text = shopOne
        shopTwoLabel.text = shopTwo
        dateLabel.text = "\(dateOne)"
        //data needs to come from other ViewController - the one that generates the receipts
    }

    
}

