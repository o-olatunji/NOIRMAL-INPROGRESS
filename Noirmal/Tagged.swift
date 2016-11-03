//
//  Tagged.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 11/3/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//
import UIKit

class Tagged {
    
    let name: String
    let pricing: String
    let company: String
    let image: UIImage
    let tagColor: UIImage
    
    init(name: String, pricing: String, company: String, image: UIImage, tagColor: UIImage) {
        
        self.name = name
        self.pricing = pricing
        self.company = company
        self.image = image
        self.tagColor = tagColor
        
    }
    
}
