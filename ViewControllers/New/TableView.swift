//
//  TableView.swift
//  11_feb
//
//  Created by Annamaria Simon on 15/03/2020.
//  Copyright © 2020 Annamaria Simon. All rights reserved.
//

/* import UIKit

class TableView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var colorsArray = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "tableviewcellid")

    }
    
}

extension TableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArray.objectsArray[section].subcategory.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
    }
    
    //Category Title:
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()   //SHOULD BE SHOP IMAGE, UIIMAGE
        headerView.backgroundColor = UIColor.green
        let titleLabel = UILabel(frame: CGRect(x: 8, y:0, width: 200, height: 44))
        headerView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.text = colorsArray.objectsArray[section].category //SHOULD BE SHOPNAME
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPatch: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcellid") as? TableView {
            //Show Subcategory Title:
            let subCategoryTitle = colorsArray.objectsArray[IndexPath.section].subcategory
            cell.subCategoryLabel.text = subCategoryTitle[IndexPath.row]
            
            //Pass the data to the collectionview inside tableviewcell
            let rowArray = colorsArray.objectsarray[IndexPath.section].colors[IndexPath.row]
            cell.updateCellWith(row: rowArray)
            
            cell.cellDelegate = self
            
            return cell
        }
        
        return UITableViewCell
        
    }
    
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsviewcontrollerseg" {
            let DestViewController = segue.destination as! DetailsViewController
            DestViewController.backgroundColor = tappedCell.color
            DestViewController.backgroundColorName = tappedCell.name
        }
    }
}

extension TableView: CollectionViewCellDelegate {
    func collectionView(collectionviewcell: CollectionViewCell?, index: Int, didTappedInTableViewCell: TableViewCell) {
        if let colorsRow = didTappedInTableViewCell.rowWithColors {
            self.tappedCell = colorsRow[index]
            performSegue(withIdentifier: "detailsviewcontrollerseg", sender: self)
            // You can also do changes to the cell you tapped using the 'collectionviewcell'
        }
    }
}
*/
