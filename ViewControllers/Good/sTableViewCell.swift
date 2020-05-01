import UIKit
import Foundation

class sTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UITextView!

func setNews(new: News){
        logoImageView.image = new.image
        nameLabel.text = new.title
        infoLabel.text = new.news
    }
}
