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
    
    ]
    
    let lips: [Product] = [
        
    ]
    
    let face: [Product] = [
        
    ]
    
    let cheeks: [Product] = [
        
    ]
    
    let tools: [Product] = [
        
    ]
    
    let tutorials: [Product] = [
        
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            
        case 1:
            
        case 2:
            
        case 3:
            
        case 4:
            
        case 5:
            
        case 6:
            
        }
        
    }
    
}
