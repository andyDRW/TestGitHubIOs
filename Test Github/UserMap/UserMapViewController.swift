//
//  UserMapViewController.swift
//  Test Github
//
//  Created by Андрей Прокопенко on 25/04/2019.
//  Copyright © 2019 Andrey Prokopenko. All rights reserved.
//
import MapKit
import UIKit
import Kingfisher

class UserMapViewController: UIViewController {

    var user:GitHubUser?
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let avatarUrl = URL(string: user?.avatarUrl ?? ""){
            avatarImageView?.kf.setImage(with: avatarUrl)
        }
        nameLabel.text=user?.login
        
        showMap(user?.location ?? "")

        // Do any additional setup after loading the view.
    }
    
    func showMap(_ location:String) {
        let geocoder:CLGeocoder = CLGeocoder();
        geocoder.geocodeAddressString(location) { [weak self] (placemarks, error) in
            if placemarks?.count ?? 0 > 0 {
                if let topResult:CLPlacemark = placemarks?.first{
                    let placemark: MKPlacemark = MKPlacemark(placemark: topResult);
                    let region = MKCoordinateRegion(center: placemark.location!.coordinate, latitudinalMeters: 50000, longitudinalMeters: 50000)
                    self?.mapView.setRegion(region, animated: true);
                    self?.mapView.addAnnotation(placemark);
                    
                }
            }
        }
        
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
