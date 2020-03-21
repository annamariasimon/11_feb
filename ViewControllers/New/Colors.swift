import Foundation
import UIKit

/* struct Colors {
    var objectsArray = [
    
        TableViewCellModel(
            category: "Today", //get the date from last transaction
            subcategory: ["SUBCATEGORY"],
            colors:
            //ASDA
                [CollectionViewCellModel(color: UIColor.colorFromHex("#DA70D6"), name: "Orchid"),
                 CollectionViewCellModel(color: UIColor.colorFromHex("#FFF5EE"), name: "Seashell"),
                 CollectionViewCellModel(color: UIColor.colorFromHex("#FFDEAD"), name: "Navajo White"),
                 CollectionViewCellModel(color: UIColor.colorFromHex("#00FF00"), name: "Lime"),
                 CollectionViewCellModel(color: UIColor.colorFromHex("#F0E68C"), name: "Khaki")]),
                
           
        TebleViewCellModel(
                category: "Yesterday",
               subcategory: ["SUBCATEGORY"],
                colors: [
                [CollectionViewCellModel(color: UIColor.colorFromHex("#9966CC"), name: "Amethyst")]
                ]),
        
        TableViewCellModel(
            category: "12 March",
            subcategory: ["SUBCATEGORY"],
            colors: [
            [CollectionViewCellModel(color: UIColor.colorFromHex("#FF6347"), name: "Tomato"),
            CollectionViewCellModel(color: UIColor.colorFromHex("#4682B4"), name: "Steel Blue"),
            CollectionViewCellModel(color: UIColor.colorFromHex("#778899"), name: "Light Slate Gray"),
            CollectionViewCellModel(color: UIColor.colorFromHex("#191970"), name: "Midnight Blue"),
            CollectionViewCellModel(color: UIColor.colorFromHex("#A52A2A"), name: "Brown")]
            ])
    ]
}

extension UIColor {
    static func rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whiteSpacesAndNewLines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6 {
            return UIColor.cyan
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        return UIColor(red: CGFloat((rgb & 0xFF0000) >> 16) / 255,
                       green: CGFloat ((rgb & 0x00FF00) >> 8) / 255,
                       blue: CGFloat (rgb & 0x0000FF) / 255,
                       alpha: 1.0)
    }
    
}
*/
