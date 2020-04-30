import Foundation
import UIKit

class News {
    
    var image: UIImage
    var title: String
    var news: String
   
    
    init(image: UIImage, title: String, news: String) {
        self.image = image
        self.title = title
        self.news = news
    }
}
