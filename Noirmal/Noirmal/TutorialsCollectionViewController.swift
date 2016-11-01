//
//  TutorialsCollectionViewController.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 11/1/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit



class TutorialsCollectionViewController: UICollectionViewController {
    
    let videos: [Videos] = [
    
        Videos(title: "Dark Skin | How To Bake Your Face", video: "https://www.youtube.com/embed/2vhjH0f41Ao"),
        Videos(title: "How To Highlight & Contour for Dark Skin Girls", video: "https://www.youtube.com/embed/jOgESdCOgeQ"),
        Videos(title: "100% Drugstore Easy Fall Makeup Tutorial", video: "https://www.youtube.com/embed/0aGg_TiBehc"),
        Videos(title: "Olive Green Smokey Eye Makeup Tutorial | WOC", video: "https://www.youtube.com/embed/FuA7QtdkiG4"),
        Videos(title: "Neutral Cut Crease & Brown Ombrè Lips Makeup Tutorial", video: "https://www.youtube.com/embed/f8diaoCsrTQ"),
        Videos(title: "Everyday makeup tutorial |WOC|", video: "https://www.youtube.com/embed/_19HfiUCLxs"),
        Videos(title: "TOP 10 NUDE LIPSTICKS FOR DARK SKIN", video: "https://www.youtube.com/embed/Ybvyp3lxIu0"),
        Videos(title: "5 Pink Nude Lips Combos for Darker Skin! WOC", video: "https://www.youtube.com/embed/YgB5SrNSYjw"),
        Videos(title: "36 MAC Lipsticks on Darker Skin", video: "https://www.youtube.com/embed/O7FddQAEuKU"),
        Videos(title: "Top NUDE Lips for WOC//DO's & DON'Ts!", video: "https://www.youtube.com/embed/Cff_8-n1XuI")
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return videos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? VideosCollectionViewCell else { return UICollectionViewCell() }
    
        let video = videos[indexPath.row]
        
        cell.videoTitle.text = video.title
        cell.videoView.allowsInlineMediaPlayback = true
        cell.videoView.loadHTMLString("<iframe width=\"199\" height=\"161\" src=\"\(video.video)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
    
        return cell

    }



}
