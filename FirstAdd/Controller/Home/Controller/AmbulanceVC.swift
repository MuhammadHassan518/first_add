//
//  Ambulance.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 29/07/2024.
//

import UIKit
import GoogleMaps

class AmbulanceVC: UIViewController, GMSMapViewDelegate {

    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnConfirmLocations: UIButton!

    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapLoader()
        addMarker()
        btnConfirmLocations.layer.cornerRadius = 20
    }
    
    func mapLoader() {
        let camera:GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 24.858956, longitude: 67.061330, zoom: 16)
        self.mapView.delegate = self
        self.mapView.camera = camera
    }

    func addMarker(){
        let mapCenter1 = CLLocationCoordinate2DMake(24.8571197, 67.0612488)
           let marker1 = GMSMarker(position: mapCenter1)
           marker1.icon = UIImage(named: "ambolanceVehicle")
           marker1.map = mapView
        
        
        let mapCenter2 = CLLocationCoordinate2DMake(24.8586291, 67.0619209)
            let marker2 = GMSMarker(position: mapCenter2)

            marker2.icon = UIImage(named: "ambolanceVehicle")
            marker2.map = mapView
        
        
        let mapCenter3 = CLLocationCoordinate2DMake(24.858956, 67.061330)
            let marker3 = GMSMarker(position: mapCenter3)

            marker3.icon = UIImage(named: "locationIcon")
            marker3.map = mapView
        
        
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
