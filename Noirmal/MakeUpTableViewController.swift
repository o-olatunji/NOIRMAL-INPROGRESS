//
//  MakeUpTableViewController.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 11/1/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit

class MakeUpTableViewController: UITableViewController {
    
    var products: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(products)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "makeupcell", for: indexPath) as? MakeUpTableViewCell else { return UITableViewCell() }
        
        let product = products[indexPath.row]
        
        cell.company.text = product.company
        cell.productImage.image = product.image
        cell.productName.text = product.name
        cell.pricing.text = product.pricing
        
        return cell
    }
    
    
    @IBAction func addToWishlistButtonClicked(_ sender: UIButton) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            wishlist.append(products[indexPath.row])
        }
    
        sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        sender.transform = .identity
            },
                       completion: nil)
        
        
    }
    
    
}

/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


