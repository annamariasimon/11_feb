import UIKit
import Firebase
import FirebaseFirestore

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let reuseIdentifier = "Cell"
    
    var itemSize: CGSize = CGSize(width: 0, height: 0)
    var items: [Receipt] = []
    var currentItem: Receipt?

    
    let transition = SlideInTransition()
    var topView: UIView?
    
    @IBAction func didTapLocation(_ sender: Any) {
        let map = storyboard?.instantiateViewController(identifier: "mapVC") as! map2ViewController
        present(map, animated: true)
        
    }
    
    @IBAction func didTapNews(_ sender: Any) {
        let profile = storyboard?.instantiateViewController(identifier: "profile") as! ProfileViewController
               present(profile, animated: true)
    }
    
    @IBAction func didTapProfile(_ sender: Any) {
       let news = storyboard?.instantiateViewController(identifier: "newsVC") as! DataTableViewController
       present(news, animated: true)
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
      guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else {  return }
           menuViewController.didTapMenuType = { menuType in
               self.transitionToNew(menuType)
           }
           menuViewController.modalPresentationStyle = .overCurrentContext
           menuViewController.transitioningDelegate = self
       present(menuViewController, animated: true)
       }
       
       func transitionToNew(_ menuType: MenuType) {
           let titleMenu = String(describing: menuType).capitalized
           self.title = titleMenu
            
        topView?.removeFromSuperview()
        switch menuType {
        case .privacypol:
            let view = UIView()
            view.backgroundColor = .black
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        default:
            break
        }
       }
    
    @IBAction func add(_ sender: Any) {
        
              let asdaBournemouth = shopInfo(number: 1, name: "Asda", shopId: "0cInZlOAQ8Sxw5g4LDOo")
                let asdaLondon = shopInfo(number: 2, name: "Asda", shopId: "REtrTEyKNMp1MtCIp13U")
                let bootsSouthampton = shopInfo(number: 3, name: "Boots", shopId: "Sf9VLKJfgCD4lPNajlac")
                let mcDonalds = shopInfo(number: 4, name: "McDonald's", shopId: "gKiMegtaLcdZRi8QjPwc")
                let wilkoBmouth = shopInfo(number: 5, name: "Wilko", shopId: "jFXAEGOUizcX54IYqJHf")
                let tescoBmouth = shopInfo(number: 6, name: "Tesco", shopId: "khsLvNNalOCrVQoX1VRr")
                let primarkLondon = shopInfo(number: 7, name: "Primark", shopId: "luGnSsJwJKONgYEFRD1p")
                let pretLondon = shopInfo(number: 8, name: "Pret A Manger", shopId: "rXckMomoWK7ccT77gfzX")
                
                let array = [asdaBournemouth, asdaLondon, bootsSouthampton, mcDonalds, wilkoBmouth, tescoBmouth, primarkLondon, pretLondon]
                let oneShop = array.randomElement()
                
                let randomNumber = Double.random(in: 0...100)
                let goodPrice = Double(round(100*randomNumber)/100)
                
                let paymentArray = ["MasterCard Debit", "Cash Payment", "Visa Debit", "Visa", "MasterCard", "American Express"]
                let randomPayment = paymentArray.randomElement()
                
                let receipts = Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid).collection("receipts")
                
                receipts.addDocument(data:["companyName":oneShop?.name, "date": Timestamp(), "itemPrice":goodPrice, "paymentMethod":randomPayment, "shopId":oneShop?.shopId])
                { error in
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
                        r.shopId = document["shopId"] as? String
                        
                        self.items.append(r)
                        self.collectionView.reloadData()
                    }
                    
                    self.items.sort { $0.date > $1.date } //SORTING FROM MOST CURRENT TO OLDEST
                    
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
                    let height = collectionView.frame.height / 5
                    layout.minimumLineSpacing = 10
                    layout.minimumInteritemSpacing = 0
                    layout.estimatedItemSize = itemSize
                    itemSize = CGSize(width: width, height: height)
                    
                    loadReceipts()
                }
            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return itemSize
            }

            override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                currentItem = items[indexPath.row]
                performSegue(withIdentifier: "showDetail", sender: nil)
            }
            
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let viewController = segue.destination as? ClickViewController {
                    viewController.item = currentItem
                }
            }

            override func numberOfSections(in collectionView: UICollectionView) -> Int {
                return 1
            }

            override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return items.count
            }

            override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
                
                let receipt = items[indexPath.row]
                cell.label.text = receipt.companyName
                
                cell.label2.text = receipt.paymentMethod //this should be the date
                
                
                
           //     let priceValue = "£\(receipt.itemPrice))" as? String
                
                cell.priceLabel.text = "£\(receipt.itemPrice!)"
                
                
                
                return cell
            }
        }

          extension CollectionViewController: UIViewControllerTransitioningDelegate {
            func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
                transition.isPresenting = true
                return transition
            }
            func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
                transition.isPresenting = false
                return transition
            }
        }
