import Foundation

public class DataLoader{
    
    @Published var ShopsData = [shopsData]()
    
    init() {
        load()
        sort()
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "shopData", withExtension: "json") {
           
            //do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation) //if it says throws we need to add try in front of it
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([shopsData].self, from: data)
                
                self.ShopsData = dataFromJson
                
            } catch{
                print(error)
            }
        }
    }
    
    func sort() {
        self.ShopsData = self.ShopsData.sorted(by: { $0.id < $1.id })
    }
    
}
