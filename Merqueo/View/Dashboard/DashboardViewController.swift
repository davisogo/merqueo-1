//
//  DashboardViewController.swift
//  Merqueo
//
//  Created by Leonardo Mendez on 20/10/17.
//  Copyright © 2017 Leonardo Mendez. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import UIColor_Hex_Swift

class DashboardViewController: UIViewController, NVActivityIndicatorViewable{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var restaurant = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        createTable()
        loadInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInfo(){
        self.startAnimating(message: "Cargando...", type: NVActivityIndicatorType.ballClipRotate)
        DataService.sharedInstance.getRestaurant { (restaurant) in
            self.restaurant = restaurant!
            self.restaurant.remove(at: 0)
            self.tableView.reloadData()
            self.stopAnimating()
        }
    }
    
    func setNavigationBar(){
        let titleLabel = UILabel()
        titleLabel.text = "Menu Principal"
        titleLabel.sizeToFit()
        titleLabel.textColor = UIColor.white
        self.navigationItem.titleView = titleLabel
        self.navigationController?.navigationBar.barTintColor = UIColor("#292C36")
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    @IBAction func organizer(_ sender: Any) {
        
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            //All
            loadInfo()
            break
        case 1:
            //Name
            self.restaurant.sort { $0.name < $1.name }
            break
        case 2:
            //Rating
            self.restaurant.sort { $0.rating > $1.rating }
            break
        default:
            break
        }
        self.tableView.reloadData()
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource{
    
    func createTable() {
        self.tableView.register(UINib(nibName: "DashboardTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let vc = ProductDetailsViewController(nibName: "ProductDetailsViewController", bundle: nil)
        vc.restaurantSelected = self.restaurant[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DashboardTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DashboardTableViewCell
        cell.config(restaurant[indexPath.row])
        return cell
    }
}
