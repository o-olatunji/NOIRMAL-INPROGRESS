//
//  TaggedTableViewCell .swift
//  Noirmal
//
//  Created by Olamide Olatunji on 11/3/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit

class TaggedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var tagColor: CircleImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var company: UILabel!
}
