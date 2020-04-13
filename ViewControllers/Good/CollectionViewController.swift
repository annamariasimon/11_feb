import UIKit
import Firebase
import FirebaseFirestore
import SwiftDate

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let reuseIdentifier = "Cell"
    
    let datan = DataLoader().ShopsData
    
    var itemSize: CGSize = CGSize(width: 0, height: 0)
    var items: [Receipt] = []
    var currentItem: Receipt?
    
    let uk = Region(calendar: Calendars.gregorian, zone: Zones.europeLondon, locale: Locales.english) //NEW - SWIFTDATE
    
    @IBAction func add(_ sender: Any) {
        let receipts = Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid).collection("receipts")
        
        receipts.addDocument(data:["companyName":"Asda", "date": Timestamp(), "itemPrice":Double.random(in: 0...100), "paymentMethod":"MasterCard Debit"]) { error in
            self.loadReceipts()
        }
    }
    
    
    func loadReceipts() {
      let receipts = Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid).collection("receipts")
        
        receipts.getDocuments { (snapshot, error) in
            
            guard let documents = snapshot?.documents else{
                return
            }
            
            self.items.removeAll()
            
            for document in documents {
                let r = Receipt()
               // r.telephone = document["telephone"] as? Int
                r.companyName = document["companyName"] as? String
                r.timestamp = document["date"] as? Timestamp
                r.itemPrice = document["itemPrice"] as? Double
                r.paymentMethod = document["paymentMethod"] as? String
                
                self.items.append(r)
                self.collectionView.reloadData()
            }
            
            self.items.sort { $0.date > $1.date } //SORTING FROM MOST CURRENT TO OLDEST
            
            
   /*         let date3 = DateInRegion(components: {
                $0.year = 2018
                $0.month = 2
                $0.day = 1
                $0.hour = 23
            }
            
            
            let diff = Timestamp.dateValue()
                Calendar.current.dateComponents([.day], from: self, to: date)
            if diff.day == 0 {
                print("same day")
            } else {
                print("different day")
            }

            
            
            var dates = [Date]() //date of the receipt
            var x = ["2020-03-13"] //look at if the day is the same so this should be the day of every date, RECEIPT.DATE.DAY component
            
            for z in x {
                if !dates.contains(z) {
                    dates.append(z)
                } */
                
          //  let dateA = DateInRegion("2020-03-14 00:00:00", format: format, region:)
            
            
            SwiftDate.defaultRegion = self.uk
            let dateInUK = "2020-02-11 00:00:00".toDate()! //need to convert this into Timestamp
            print("Current year is \(dateInUK.year) and hour is \(dateInUK.hour)")
            let dateInUTC = dateInUK.convertTo(region: Region.UTC)
            print("Current year is \(dateInUTC.year) and hour is \(dateInUTC.hour)")
            
            let regionLondon = Region(calendar: Calendars.gregorian, zone: Zones.europeLondon, locale: Locales.english)
            
            let date1 = DateInRegion(components: {
                $0.year = dateInUTC.year
                $0.month = dateInUTC.month
                $0.day = dateInUTC.day
                
            }, region: regionLondon)
            print(date1)
            
            
            let format = "yyyy-MM-dd HH:mm"
                      let d1 = "2020-03-13 00:00".toDate(format, region: Region.current)
                      let d2 = "2020-03-14 23:59".toDate(format, region: Region.current)
                    // let diff = d1!.differences(in: [.day, .hour], from: d2!)
            
            
                          
                          var dates = [Int]()
                          var x = [1,2,3,4,5,1,2,4,1,8]
                          
                          for z in x {
                              if !dates.contains(z) {
                                  dates.append(z)
                              }
            }
            
            print(dates)
            
            
        }
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemsPerRow: CGFloat = 1
            let padding: CGFloat = 12
            let totalPadding: CGFloat = padding * (itemsPerRow)
            let individualPadding: CGFloat = totalPadding / itemsPerRow
            let width = collectionView.frame.width / itemsPerRow - individualPadding
            let height = collectionView.frame.height / 4
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 0
            layout.estimatedItemSize = itemSize
            itemSize = CGSize(width: width, height: height)
            
            //FIRESTORE:
            loadReceipts()
            
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    } //important so it returns the right size


    // MARK: - Navigation

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentItem = items[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ClickViewController {
            viewController.item = currentItem
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return items.count
    } //IMPORTANT - the number of items -› number of days later
    
  /*  override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    */

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let receipt = items[indexPath.row]
        
        cell.label.text = receipt.companyName
       // cell.label.text = datan[0].name
        
        struct dateText {
            //define date text from swift date and timestamp
            
        }
        
        cell.label2.text = receipt.paymentMethod //this should be the date
        
        
        return cell
    }

    // MARK: UICollectionViewDelegate

}
