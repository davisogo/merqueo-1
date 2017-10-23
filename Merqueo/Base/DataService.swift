//
//  DataService.swift
//  Merqueo
//
//  Created by Leonardo Mendez on 21/10/17.
//  Copyright © 2017 Leonardo Mendez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class DataService{
    
    static let sharedInstance = DataService()
    let baseUrl = "https://api.myjson.com/bins/1zib8"
    
    let realm = try! Realm()
    var restaurantData = [Restaurant]()
    
    func getRestaurant(cb: @escaping([Restaurant]?)->()){
        
        let url = URL(string: baseUrl)
        
        self.restaurantData.removeAll()
        try! self.realm.write {
            self.realm.delete(self.realm.objects(Restaurant.self))
        }
        
        Alamofire.request(url!, method: .get).validate().responseJSON { (response) in
            
            if let value = response.result.value {
                let json = JSON(value)
                for  (_,subJson):(String, JSON) in json {
                    self.restaurantData.append(Restaurant().restaurantFromJson(subJson))
                }
                cb(self.restaurantData)
            }
        }
    }
}
