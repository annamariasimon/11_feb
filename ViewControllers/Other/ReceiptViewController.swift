import UIKit


/* struct Receipt {
    var date: String
    var companyName: String
    var companyInfo: String
    var itemSold: String
    var itemPrice: CGFloat
    var currency: String
    var total: CGFloat
    var VAT: CGFloat
    var paymentMethod: String
    var returnPolicy: String
    var authorisationNo: Int
} */

class ReceiptViewController: UIViewController {
   var receipts = [String]()
    let price = Int.random(in: 0 ... 800)
    let date = Date()
    let VAT: Int = 20
    let authNumb = Int.random(in: 100000 ... 999999)
    let purchasedItemOne: String = "Bread"
    var totalPayed: Int = 0
    var returnMessage: String = "PLEASE KEEP THIS COPY FOR YOUR RECORDS"
    var storeName: String = "Asda"
    var storeInfo: String = "Bournemouth"

    //FOR RANDOM ARRAYS
    let purchasedItem = ["Bread", "Milk", "Chocolate", "Water", "Shoes", "Notepad", "Laptop", "Pizza"]
  //  if let randomItem = purchasedItem.randomElement()
    let randomShop = ["Asda", "Marks & Spencer", "FootLocker", "Domino's", "Tesco", "Co-op"]

    //ADDING - TOTAL
    let total: Int = 34
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
     receipts = ["\(date)", "\(storeName)", "\(storeInfo)", "\(purchasedItemOne)    £\(price)", "Total:     £\(price)", "VAT:       \(VAT)%", "AUTHORISATION No. \(authNumb)", "\(returnMessage)"]
        
        tableView.reloadData()
        
        //watching the users receipt collection
        
            /*    receiptInfo.append(Receipt(date: "10 February 2020", companyName: "Asda", companyInfo: "Bournemouth", itemSold: "Bread", itemPrice: 5, currency: "£", total: 5, VAT: 20, paymentMethod: "Visa Cntactless", returnPolicy: "PLEASE KEEP THIS COPY FOR YOUR RECORDS", authorisationNo: 123456)) */
        
    }
    
    
    @IBAction func add(_ sender: Any) {
        //send a receipt
        
    }
    
    
}

extension ReceiptViewController: UITableViewDataSource, UITableViewDelegate {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receipts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let receiptForCell = receipts[indexPath.row]
        cell.textLabel?.text = receiptForCell
    
  /*  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
     let receiptForCell = receiptInfo[indexPath.row]
       cell.textLabel?.text = receiptForCell */
    
        return cell
    }
    
}
