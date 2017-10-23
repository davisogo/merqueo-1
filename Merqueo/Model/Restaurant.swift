//
//  Restaurant.swift
//  Merqueo
//
//  Created by Leonardo Mendez on 21/10/17.
//  Copyright © 2017 Leonardo Mendez. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Restaurant: Object {
    @objc dynamic var categories : String!
    @objc dynamic var delivery : String!
    @objc dynamic var urlDetail : String!
    @objc dynamic var path : String!
    @objc dynamic var name : String!
    @objc dynamic var rating : String!
    @objc dynamic var deliveryTime : String!
    @objc dynamic var Location : String!
    
    
    
    func restaurantFromJson(_ json: JSON) -> Restaurant{
        let restaurant = Restaurant()
        
        restaurant.categories = json["categorias"].stringValue
        restaurant.delivery = json["domicilio"].stringValue
        restaurant.urlDetail = json["url_detalle"].stringValue
        restaurant.path = json["logo_path"].stringValue
        restaurant.name = json["nombre"].stringValue
        restaurant.rating = json["rating"].stringValue
        restaurant.deliveryTime = json["tiempo_domicilio"].stringValue
        restaurant.Location = json["ubicacion_txt"].stringValue
        
        
        return restaurant
    }
}
