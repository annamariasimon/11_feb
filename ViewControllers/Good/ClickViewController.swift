import UIKit
import Firebase

class ClickViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var item: Receipt!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let i = item else {return}
            textView.text = "\(i.date!)\n\n\(i.companyName!)\n\nPrice: £\( i.itemPrice!)\n\n\(i.paymentMethod)"
                
            //should only appear if it's not nil
        
    }

    func save() {
        // send this to firebase
        // ref users/uid/receipts
     //   ref.setData(item?.dictionary)
       
    }
    
}
