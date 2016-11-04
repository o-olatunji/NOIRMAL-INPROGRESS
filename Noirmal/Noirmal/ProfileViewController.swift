//
//  ProfileViewController.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 10/20/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit
import Photos

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var changeView: UIView!
    @IBOutlet weak var profileBackgroundImage: UIImageView!
    let picker = UIImagePickerController()
    
    //  func changeProfileImage(notification: Notification) {
    
    // NotificationCenter.default.addObserver(self, selector: #selector(ProfileViewController.changeProfileImage), name: NSNotification.Name(rawValue: "changeProfileImage"), object: nil)
    
    //    print("changed")
    
    //   }
    
    
    let profile: [ProfileSettings] = [
        
        ProfileSettings(name: "My Wishlist"),
        ProfileSettings(name: "My Hue"),
        ProfileSettings(name: "Find Stores Near Me")
        
    ]
    
    // import existing photo when button is tapped
    
    @IBAction func profilePictureButtonTapped(_ sender: AnyObject) {
        
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        picker.delegate = self
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        var  chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        profilePicture.contentMode = .scaleAspectFill
        profilePicture.image = chosenImage
        dismiss(animated:true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settings", for: indexPath) as? ProfileSettingsCell else { return UITableViewCell() }
        let setting = profile[indexPath.row]
        cell.settingsLabel.text = setting.name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            performSegue(withIdentifier: "wishlist", sender: self)
        }
        
        if indexPath.row == 1 {
            performSegue(withIdentifier: "choosehue", sender: self)
        }
        
        if indexPath.row == 2 {
            performSegue(withIdentifier: "maps", sender: self)
        }
   
    }
}
