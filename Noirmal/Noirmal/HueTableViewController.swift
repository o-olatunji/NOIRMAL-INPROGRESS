//
//  HueTableViewController.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 11/2/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit

class HueTableViewController: UITableViewController {
    
    var colorImageController = ProfileViewController()
    
    var hues: [Hue] = [
    
    Hue(name: "Toffee", female: #imageLiteral(resourceName: "PaulaPatton"), description: "Sweet like everyone's favorite treat. Add some sugar to your collection with products for your hue!", actresses: "Paula Patton, Jurnee Smollet-Bell, Rochelle Aytes", hue: #imageLiteral(resourceName: "Toffee")),
    Hue(name: "Caramel", female: #imageLiteral(resourceName: "Beyonce"), description: "Caramel goes with everything, just like your skin. Search for those special products to give you that special glow!", actresses: "Beyonce, Zoe Saladana, Halle Berry", hue: #imageLiteral(resourceName: "Caramel")),
    Hue(name: "Cinnamon", female: #imageLiteral(resourceName: "Eva"), description: "The perfect spice of glimmer compliments your incredible hue. Find that \"must have\" item for your collection", actresses: "Eva Pigford, Sanaa Lathan, Taraji P Henson", hue: #imageLiteral(resourceName: "Cinnamon") ),
    Hue(name: "Mocha", female: #imageLiteral(resourceName: "Gabby"), description: "You're a nice coffee on an early winter eve. Warm up your life with the best products for your hue!", actresses: "Gabrielle Union, Michelle Obama, Regina Hall", hue: #imageLiteral(resourceName: "Mocha")),
    Hue(name: "Cocoa", female: #imageLiteral(resourceName: "Tika Sumpter"), description: "Everybody loves chocolate, and your hue is a universal craving. We've got the perfect palette to bring out your shine - click away!", actresses: "Tika Sumpter, Viola Davis, Lupita N'yongo", hue: #imageLiteral(resourceName: "Cocoa"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return hues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "huecell", for: indexPath) as? HueTableViewCell else { return UITableViewCell() }
        
        let hue = hues[indexPath.row]
        
        cell.hueActressNames.text = hue.actresses
        cell.actressImage.image = hue.female
        cell.hueColorImage.image = hue.hue
        cell.hueDescription.text = hue.description
        cell.hueColorName.text = hue.name
        
        return cell
    }
    
    
    @IBAction func hueButtonClicked(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Add To Profile", message: "Do you want to add this hue to your profile?", preferredStyle: UIAlertControllerStyle.alert)
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (result: UIAlertAction) -> Void in
            print("Cancel")
        }
        let ProceedAction = UIAlertAction(title: "Yes, add my hue", style: UIAlertActionStyle.default) { (result: UIAlertAction) -> Void in
            print("added")
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                self.colorImageController.profileBackgroundImage.image = self.hues[indexPath.row].hue
            }
            //eventually this is where i'll append the profile image 
            
            
        }
        alertController.addAction(CancelAction)
        alertController.addAction(ProceedAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    

    
}
