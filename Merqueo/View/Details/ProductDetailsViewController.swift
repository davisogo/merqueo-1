//
//  ProductDetailsViewController.swift
//  Merqueo
//
//  Created by Leonardo Mendez on 20/10/17.
//  Copyright © 2017 Leonardo Mendez. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift
import MapKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var restaurtantImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var deliveryValueLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var restaurantSelected = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        info()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func info() {
        self.nameLabel.text = restaurantSelected.name
        self.deliveryValueLabel.text = String(format: "Valor del domicilio: $%@", restaurantSelected.delivery)
        self.deliveryTimeLabel.text = String(format: "Tiempo del domicilio: %@ minutos", restaurantSelected.deliveryTime)
        self.categoryLabel.text = String(format: "Categoria: %@", restaurantSelected.categories)
        map()
        star()
        restaurantImage()
    }
    
    func setNavigationBar(){
        let titleLabel = UILabel()
        titleLabel.text = "Detalles"
        titleLabel.sizeToFit()
        titleLabel.textColor = UIColor.white
        self.navigationItem.titleView = titleLabel
        self.navigationController?.navigationBar.barTintColor = UIColor("#292C36")
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    func map(){
        let myString: String = restaurantSelected.Location
        var myStringArr = myString.components(separatedBy: ",")
        let location = CLLocationCoordinate2DMake((CLLocationDegrees(Int((myStringArr[0] as NSString).intValue))), (CLLocationDegrees(Int((myStringArr[1] as NSString).intValue))))
        let span = MKCoordinateSpanMake(0.2, 0.2)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = location
        dropPin.title = restaurantSelected.name
        mapView.addAnnotation(dropPin)
        
    }
    
    func star(){
        switch restaurantSelected.rating {
        case "1":
            self.star1.image = #imageLiteral(resourceName: "star_on")
            self.star2.image = #imageLiteral(resourceName: "star_off")
            self.star3.image = #imageLiteral(resourceName: "star_off")
            self.star4.image = #imageLiteral(resourceName: "star_off")
            self.star5.image = #imageLiteral(resourceName: "star_off")
            break
        case "2":
            self.star1.image = #imageLiteral(resourceName: "star_on")
            self.star2.image = #imageLiteral(resourceName: "star_on")
            self.star3.image = #imageLiteral(resourceName: "star_off")
            self.star4.image = #imageLiteral(resourceName: "star_off")
            self.star5.image = #imageLiteral(resourceName: "star_off")
            break
        case "3":
            self.star1.image = #imageLiteral(resourceName: "star_on")
            self.star2.image = #imageLiteral(resourceName: "star_on")
            self.star3.image = #imageLiteral(resourceName: "star_on")
            self.star4.image = #imageLiteral(resourceName: "star_off")
            self.star5.image = #imageLiteral(resourceName: "star_off")
            break
        case "4":
            self.star1.image = #imageLiteral(resourceName: "star_on")
            self.star2.image = #imageLiteral(resourceName: "star_on")
            self.star3.image = #imageLiteral(resourceName: "star_on")
            self.star4.image = #imageLiteral(resourceName: "star_on")
            self.star5.image = #imageLiteral(resourceName: "star_off")
            break
        case "5":
            self.star1.image = #imageLiteral(resourceName: "star_on")
            self.star2.image = #imageLiteral(resourceName: "star_on")
            self.star3.image = #imageLiteral(resourceName: "star_on")
            self.star4.image = #imageLiteral(resourceName: "star_on")
            self.star5.image = #imageLiteral(resourceName: "star_on")
            break
        default:
            break
        }
    }
    
    func restaurantImage(){
        
        switch restaurantSelected.name {
        case "Pollo Y Sabor":
            self.restaurtantImage.image = #imageLiteral(resourceName: "picorico")
            break
        case "Jennos":
            self.restaurtantImage.image = #imageLiteral(resourceName: "JenosPizza")
            break
        case "La Perla":
            self.restaurtantImage.image = #imageLiteral(resourceName: "laperla")
            break
        case "Qbano":
            self.restaurtantImage.image = #imageLiteral(resourceName: "qbano")
            break
        case "Arepitas":
            self.restaurtantImage.image = #imageLiteral(resourceName: "arepita")
            break
        case "KFC":
            self.restaurtantImage.image = #imageLiteral(resourceName: "kfc")
            break
        case "Mexico":
            self.restaurtantImage.image = #imageLiteral(resourceName: "mexico")
            break
        case "Domino's":
            self.restaurtantImage.image = #imageLiteral(resourceName: "Domino's")
            break
        case "Presto":
            self.restaurtantImage.image = #imageLiteral(resourceName: "presto")
            break
        default:
            break
        }
    }
}
