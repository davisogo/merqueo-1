//
//  DashboardTableViewCell.swift
//  Merqueo
//
//  Created by Leonardo Mendez on 20/10/17.
//  Copyright © 2017 Leonardo Mendez. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ViewCell: UIView!
    @IBOutlet weak var restaurtantImage: UIImageView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(_ restaurant: Restaurant){
        nameLabel.text = restaurant.name
        switch restaurant.rating {
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
        switch restaurant.name {
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
        self.restaurtantImage.layer.cornerRadius = 20.5
        self.restaurtantImage.layer.borderWidth = 1
        self.restaurtantImage.layer.borderColor = UIColor.lightGray.cgColor
    }
}

extension UIView {
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
