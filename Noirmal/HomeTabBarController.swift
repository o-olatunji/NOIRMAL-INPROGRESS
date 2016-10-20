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
        Categories(name: "Hoisery"),
        Categories(name: "Intimate"),
        Categories(name: "Other Products")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
}
