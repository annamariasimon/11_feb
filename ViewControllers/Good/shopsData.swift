//
//  shopsData.swift
//  11_feb
//
//  Created by Annamaria Simon on 12/04/2020.
//  Copyright © 2020 Annamaria Simon. All rights reserved.
//

import Foundation

struct shopsData: Codable {
    var name: String 
          var category: String
          var address: String
          var city: String
          var id: Int
          var postcode: String
          fileprivate var imageName: String
          fileprivate var coordinates: Coordinates
          
}
      
struct Coordinates: Hashable, Codable {
          var latitude: Double
          var longitude: Double
}
