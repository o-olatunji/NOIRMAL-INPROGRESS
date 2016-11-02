//
//  WishlistViewController.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 11/1/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit
import Social 

class WishlistViewController: UITableViewController {
    

    @IBAction func shareToTwitter(_ sender: UIButton) {
    }
    
    
   
    @IBAction func shareToFacebook(_ sender: AnyObject) {
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return wishlist.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "wishlistcell", for: indexPath) as? WishlistCell else { return UITableViewCell() }
        
        let wishlists = wishlist[indexPath.row]
        
        cell.wishlistImage.image = wishlists.image
        cell.company.text = wishlists.company
        cell.name.text = wishlists.name
        cell.price.text = wishlists.pricing
        
        
        return cell
        
    }
    

    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteBagitem = UITableViewRowAction(style: .normal, title: " Delete") { action, index in
            
          wishlist.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
        }
        deleteBagitem.backgroundColor = UIColor.red
        
        return [deleteBagitem]
    }
    
}
