//
//  DetailCollectionViewController.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 10/20/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit

class DetailCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    let detail: [Detail] = [
    
        Detail(image: #imageLiteral(resourceName: "lips"), label: "LIPS"),
        Detail(image: #imageLiteral(resourceName: "Blue-Eyeshadow2-1"), label: "EYES"),
        Detail(image: #imageLiteral(resourceName: "face"), label: "FACE"),
        Detail(image: #imageLiteral(resourceName: "blush"), label: "CHEEKS"),
        Detail(image: #imageLiteral(resourceName: "tools"), label: "TOOLS"),
        Detail(image: #imageLiteral(resourceName: "tutorial "), label: "TUTORIALS")
    ]
    
    let eyes: [Product] = [
        
        Product(name: "Sephora Collection Cookie Crunch", pricing: "$13.00", company: "Sephora", image: #imageLiteral(resourceName: "Sephora Collection Cookie Crunch ")),
        Product(name: "Loreal Studio Secrets Mettalic Duo - Gilde", pricing: "$14.00", company: "L'oreal", image: #imageLiteral(resourceName: "Loreal Studio Secrets Metallic Duo")),
        Product(name: "Sephora Black Up Eye Pencil", pricing: "$9.00", company: "Sephora", image: #imageLiteral(resourceName: "sephora black up")),
        Product(name: "Sahara Daze", pricing: "$43.00", company: "Tom Ford", image: #imageLiteral(resourceName: "tomford sahara daze")),
        Product(name: "Naked 2", pricing: "$53.00", company: "Urban Decay", image:#imageLiteral(resourceName: "urban decay naked 2 "))
        
    ]
    
    let lips: [Product] = [
        Product(name: "Cyber", pricing: "$17.00", company: "Mac", image:  #imageLiteral(resourceName: "mac cyber")),
        Product(name: "Jubilee", pricing: "$17.00", company: "Mac", image:  #imageLiteral(resourceName: "mac jubilee")),
        Product(name: "Rebel", pricing: "17.00", company: "Mac", image:  #imageLiteral(resourceName: "mac rebel ")),
        Product(name: "Ruby Woo", pricing: "$17.00", company: "Mac", image: #imageLiteral(resourceName: "mac ruby woo")),
        Product(name: "Morange", pricing: "$17.00", company: "Mac", image:  #imageLiteral(resourceName: "mac morange"))
    ]
    
    let face: [Product] = [
        Product(name: "Sephora Collection Cookie Crunch", pricing: "$13.00", company: "Sephora", image: #imageLiteral(resourceName: "Sephora Collection Cookie Crunch ")),
        Product(name: "Traceless Foundation SP 15 - Almond", pricing: "$83.00", company: "Tom Ford", image: #imageLiteral(resourceName: "Tom Ford Traceless Foundation SPF 15 Almond ")),
        Product(name: "Ultra HD Foundation - Coffee", pricing: "$43.00", company: "Makeup Forever", image: #imageLiteral(resourceName: "Ultra HD Foundation - Coffee ")),
        Product(name: "All Day Luminous Weightless Foundation", pricing: "54.00", company: "NARS", image: #imageLiteral(resourceName: "All Day Luminous Weightless Foundation")),
        Product(name: "DiorSkin Star - Ebony", pricing: "$52.00", company: "Dior", image: #imageLiteral(resourceName: "DiorSkin Star Ebony"))
    ]
    
    let cheeks: [Product] = [
        Product(name: "Terracotta Bronzing Powder", pricing: "$53.00", company: "Guerlain ", image: #imageLiteral(resourceName: "Guerlain Terrecotta") ),
        Product(name: "Tantalizer Baked Bronzer", pricing: "$12.00", company: "Lorec", image: #imageLiteral(resourceName: "Lorac Tantalizer Baked Bronzer")),
        Product(name: "Pro Bronze Fusion Bronzer", pricing: "$43.00", company: "Make Up For Ever", image: #imageLiteral(resourceName: "Makeup Pro bronzer ")),
        Product(name: "Bronzing Powder - Golden Light", pricing: "$42.00", company: "Bobbi Brown", image: #imageLiteral(resourceName: "Bobbi Brown Bronzing powder")),
        Product(name: "Shimmer Bloc", pricing: "$38.00", company: "Laura Mercier", image: #imageLiteral(resourceName: "Laura Mercier Bronzer "))

    ]
    
    let tools: [Product] = [
        
    ]
    
    let nude: [Product] = [
        
    ]
    
   override func numberOfSections(in collectionView: UICollectionView) -> Int {
    
    return 1
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detail.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailcategory", for: indexPath) as? DetailCollectionViewCell else { return UICollectionViewCell() }
        
        let category = detail[indexPath.row]
        
        cell.detailCategoryImage.image = category.image
        cell.detailCategoryLabel.text = category.label
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "products" {
            
            if let indexPath = collectionView?.indexPath(for: sender as! DetailCollectionViewCell) {
                
                guard let destinationVC = segue.destination as? MakeUpTableViewController
                    else { return }
                
                switch indexPath.row {
                case 0:
                    destinationVC.products = lips
                
                case 1:
                    destinationVC.products = eyes
                
                case 2:
                    destinationVC.products = face
                    
                case 3:
                    destinationVC.products = cheeks
                    
                case 4:
                    destinationVC.products = tools
                    
                case 5:
                    
                    destinationVC.products = nude
                default:
                    break
                }
                
            }
        }
    }
    
   /* override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            let content = lips[indexPath.row]
            
            cell.
            cell.detailCategoryLabel.text = category.label
            
            return cell
            
            
            
        case 1:
            
        case 2:
            
        case 3:
            
        case 4:
            
        case 5:
            
        case 6:
            
        }
        
    } */
    
}
