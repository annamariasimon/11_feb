import UIKit
import Firebase
import FirebaseFirestore

private let reuseIdentifier = "sCell"

var itemSize: CGSize = CGSize(width: 0, height: 0)

var shop = Shop()
var items: [Shop] = []
var currentItem: Shop?

func loadShops() {
       let db = Firestore.firestore()
           
    
     /*    let shopRef = db.collection("shops").document("0cInZlOAQ8Sxw5g4LDOo")
         
         shopRef.getDocument { (document, error) in
             if error == nil {
                 if document != nil && document!.exists {
                     let documentData = document?.data()
                     
                     self.shop = Shop()
                     
                     self.shop.city = document?["city"] as? String
                     
                     self.label.text = self.shop.city
                     
                 }
             }
         }
         */
           
           db.collection("shops").getDocuments { (snapshot, error) in
               if error == nil && snapshot != nil {
                   for document in snapshot!.documents {
                       let documentData = document.data()
                       let s = shop
                       
                    s.name = document["name"] as? String
                    s.category = document["category"] as? String
                    s.address = document["address"] as? String
                    s.city = document["city"] as? String
                    s.postcode = document["postcode"] as? String
                       
                    items.append(s)
                       
                   }
               }
           }
           
           
           
       }

class shopsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

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
        // Register cell classes
      
            loadShops()
            
  //          self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return itemSize
        } //important so it returns the right size


        // MARK: - Navigation

        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            currentItem = items[indexPath.row]
         //   performSegue(withIdentifier: "showDetail", sender: nil)
        }
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
     /*   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let viewController = segue.destination as? ClickViewController {
                viewController.item = currentItem
            }
        } */

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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! sCollectionViewCell
            
            let shops = items[indexPath.row]
            
            cell.sTextView.text = shops.name
           // cell.label.text = datan[0].name
        
            
           // cell.label2.text = receipt.paymentMethod //this should be the date
            
            
            return cell
        }

        // MARK: UICollectionViewDelegate
        

    }
