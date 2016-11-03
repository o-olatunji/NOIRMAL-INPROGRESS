//
//  LocationTableViewController.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 11/3/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit
import MapKit

class LocationTableViewController: UITableViewController, UISearchControllerDelegate {
    
    var matchingItems: [MKMapItem] = []
    var mapView: MKMapView? = nil
    var handleMapSearchDelegate: HandleMapSearch? = nil
    
    
    //creating the address pulled from nearby location 
    
    func parseAddress(selectedItem: MKPlacemark) -> String {
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil)
        
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil)
        
        let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
        
        let addressLine = String(
            format: "%@%@%@%@%@%@%@",
            
            selectedItem.subThoroughfare ?? "",
            firstSpace as CVarArg,
            selectedItem.thoroughfare ?? "",
            comma as CVarArg,
            selectedItem.locality ?? "",
            secondSpace,
            selectedItem.administrativeArea ?? "")
    
        return addressLine
    
        
    }
    
    
    
}


extension LocationTableViewController: UISearchResultsUpdating {
    @available(iOS 8.0, *)
    public func updateSearchResults(for searchController: UISearchController) {
        // this unwraps the values for mapView and search bar text that you'll have once entering data
        //it then makes the search request within your region identified by Core Location
        //then it executes the search and stores the result in matching items. We display those items as response and reload the tableView
        guard let mapView = mapView,
            let searchBarText = searchController.searchBar.text else {return}
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { (response, _) in
            guard let response = response else {
                return
            }
            
            self.matchingItems = response.mapItems
            self.tableView.reloadData()
        }
    }


}


extension LocationTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationcell")!
        let selectedItem = matchingItems[indexPath.row].placemark
        
        //cell's built in label from the subtitle style
        cell.textLabel?.text = selectedItem.name
        cell.detailTextLabel?.text = parseAddress(selectedItem: selectedItem)
        
        return cell
    }
    
    
}

extension LocationTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
        handleMapSearchDelegate?.dropPinZoomIn(placemark: selectedItem)
        dismiss(animated: true, completion: nil)
    }
    
}
