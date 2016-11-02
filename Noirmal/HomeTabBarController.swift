//
//  HomeTabBarController.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 10/20/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit

class HomeTabBarController: UITableViewController {
    
    let category: [Categories] = [
        
        Categories(name: "Make Up" ),
        Categories(name: "Skin Care"),
        Categories(name: "Clothing"),
        Categories(name: "Intimate Apparel"),
        Categories(name: "Nude"),
        Categories(name: "Tutorials")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let backgroundImage = UIImage(named: "homepage1")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
    }
    
    
    override  func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchcategories", for: indexPath) as? HomeCategoryTableViewCell else { return UITableViewCell() }
        
        let cellCategory = category[indexPath.row]
        
        cell.categoryLabel.text = cellCategory.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            performSegue(withIdentifier: "makeup", sender: self)
        }
        
        if indexPath.row == 5 {
            
            performSegue(withIdentifier: "tutorials", sender: self)
        }
        
        else {
            
            performSegue(withIdentifier: "makeup", sender: self)
        }
        
    }
    
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tutorials" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                guard let destinationVC = segue.destination as? TutorialsCollectionViewController
                    else { return }
            }
    
    
}

        if segue.identifier == "makeup" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                guard let destinationVC = segue.destination as? MakeUpTableViewController
                
                    else {return}
            }
        }

} */
}
