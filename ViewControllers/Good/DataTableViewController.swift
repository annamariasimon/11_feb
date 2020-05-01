import UIKit

class DataTableViewController: UITableViewController {
    
    var news: [News] = []
    
func createArray() -> [News] {
        
    var tempNews: [News] = []
    
    let news1 = News(image: #imageLiteral(resourceName: "asdaNews"), title: "ASDAxRECEIPTABLI ANNIVERSARY", news: "Today marks a year of strong partnership in the search for a more environmentally friendly shopping experience, said Lucas Murray, Chief Customer Officer for Asda Stores Ltd. at the AsdaXReceiptabli Anniversary Talks. The event celebrated one year of successful partnership with Receiptabli's first supermarket chain partner. Murray added: a great year with many more to come. Asda’s goal is to become a flagship retailer in saving the planet." )
    let news2 = News(image: #imageLiteral(resourceName: "tescoNews"), title: "TESCO NAMED 'GREENEST SHOP'", news: "Tesco was named the ‘Greenest Shop’ for the first time in the May issue of the prestigious ‘Guilt-free Environmental’ online magazine. The article mentioned Tesco’s methods for dealing with waste production and its newly implemented machine learning solutions for stores development. Tesco’s carbon footprint had already been lower since the company started using renewable electricity, but its CO2 emissions have significantly reduced again in the past few months.")
    let news3 = News(image: #imageLiteral(resourceName: "wilkoNews"), title: "WILKO TO JOIN RECEIPTABLI FAMILY", news: "Just after opening its 416th store, Wilko signed up for a one-year trial plan with Receiptabli. The service will become available in 10 of Wilko’s bigger stores across the country from this June, and in 15 more from September. For the full list of participating shops please visit Wilko’s official website. We are excited to start working together and learn from Wilko Retail Ltd. after its successful energy efficiency solutions made headlines in early 2021.")
    let news4 = News(image: #imageLiteral(resourceName: "primarkNews"), title: "PRIMARK'S GOAL FOR 2022", news: "Primark’s new leadership has new ideas for the fast fashion retailer. Andrea Armstrong, new chief executive of Associated British Foods, Primark’s parent company said, ‘not only Primark’s damaged reputation but its old methods need repairing too. From January 2022 we will be implementing up-to-date ways to improve the company’s environmental impact like become a more active member of the Sustainable Apparel Coalition and work together with Greenpeace again.'")
    
    tempNews.append(news1)
    tempNews.append(news2)
    tempNews.append(news3)
    tempNews.append(news4)
    
    return tempNews
    
    }

override func viewDidLoad() {
    super.viewDidLoad()
    
    news = createArray()
}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let new = news[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopcell") as! sTableViewCell
        
        cell.setNews(new: new)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }

 
}


