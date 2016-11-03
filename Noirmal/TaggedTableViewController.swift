//
//  TaggedTableViewController.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 11/3/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit

class TaggedTableViewController: UITableViewController {
    
    var taggedItems: [Tagged] = [
        Tagged(name: "Sephora Collection Cookie Crunch", pricing: "$13.00", company: "Sephora", image:#imageLiteral(resourceName: "Sephora Collection Cookie Crunch ") , tagColor: #imageLiteral(resourceName: "Toffee")),
        Tagged(name: "Ruby Woo", pricing: "$17.00", company: "Mac", image: #imageLiteral(resourceName: "mac ruby woo"), tagColor: #imageLiteral(resourceName: "Toffee")),
        Tagged(name: "Terracotta Bronzing Powder", pricing: "$53.00", company: "Guerlain ", image: #imageLiteral(resourceName: "Guerlain Terrecotta"), tagColor: #imageLiteral(resourceName: "Toffee")),
        Tagged(name: "Shimmer Bloc", pricing: "$38.00", company: "Laura Mercier", image: #imageLiteral(resourceName: "Laura Mercier Bronzer "), tagColor: #imageLiteral(resourceName: "Toffee")),
        Tagged(name: "Sahara Daze", pricing: "$43.00", company: "Tom Ford", image: #imageLiteral(resourceName: "tomford sahara daze"), tagColor: #imageLiteral(resourceName: "Toffee"))
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taggedItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taggedcell", for: indexPath) as? TaggedTableViewCell else {return UITableViewCell() }
        
        
        let tag = taggedItems[indexPath.row]
        
        cell.company.text = tag.company
        cell.price.text = tag.pricing
        cell.productImage.image = tag.image
        cell.tagColor.image = tag.tagColor
        cell.productName.text = tag.name
        
        return cell
    }
   
    
    
    
    
}
