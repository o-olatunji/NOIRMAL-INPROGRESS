//
//  File.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 11/1/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit

class Product {
    
    let name: String
    let pricing: String
    let company: String
    let image: UIImage
    
    init(name: String, pricing: String, company: String, image: UIImage) {
        
        self.name = name
        self.pricing = pricing
        self.company = company
        self.image = image
        
    }
    
}
