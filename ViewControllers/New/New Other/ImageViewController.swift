import UIKit

//COLLECTIONVIEW PER DAY:

struct CustomData {
    var title: String
    var image: UIImage
    var url: String
}

class ImageViewController: UIViewController {
    
    let data = [ //these should be as many as many receipts come in a day
        
        CustomData(title: "Asda", image: #imageLiteral(resourceName: "asda_img"), url: "asda.ac.uk"), //these should come from the company profile, company info - need to connect the pictures to the ShopName
        CustomData(title: "Tesco", image: #imageLiteral(resourceName: "teso-img"), url: "tesco.com"),
        CustomData(title: "Wilko", image: #imageLiteral(resourceName: "wilko_img"), url: "wilko.com")
    ]
    
    //if showname = "Asda", UIImage = *Asda image*
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //THIS ALL SHOULD BE WRAPPED IN A COLLECTIONVIEW

        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21)) //THIS LABEL SHOULD BE ABOVE THE 2ND COLLECTIONVIEW
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .black
        label.center = CGPoint(x: 70, y: 284)
        label.textAlignment = .center
        label.text = "I am a test label" //This should be the day of the receipts
        self.view.addSubview(label)
        
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
      //  collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        
        collectionView.delegate = self //runs delegateflowlayout method and connects them to the collectionview )inside the fileprovate let...
        collectionView.dataSource = self //rund the numberofItemInSection and cellForItem functions
    }
}

extension ImageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = .white
        cell.data = self.data[indexPath.row]
        return cell
    }
}

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "ASDA-Logo")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
