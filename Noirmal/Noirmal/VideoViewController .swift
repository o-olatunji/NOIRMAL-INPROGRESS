//
//  VideoViewController .swift
//  Noirmal
//
//  Created by Olamide Olatunji on 11/1/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let youtubeURL: String = "https://www.youtube.com/embed/2vhjH0f41Ao"
        
        videoView.loadHTMLString("<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/2vhjH0f41Ao\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
    }
    
    
}
