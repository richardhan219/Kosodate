//
//  MapViewController.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/6/25.
//  Copyright © 2018年 Richard Han. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var area: Babyflat!

    @IBOutlet var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsScale = true
        mapView.showsCompass = true
        mapView.showsUserLocation = true
        mapView.showsBuildings = true
        mapView.showsTraffic = true
        
        
        let coder = CLGeocoder()
        coder.geocodeAddressString(area.FIELD5) {
            (ps, error) in
            guard let ps = ps else {
                print(error ?? "error")
                return
            }
            let place = ps.first
            let annotation = MKPointAnnotation()
            annotation.title = self.area.FIELD3
            annotation.subtitle = self.area.FIELD4
            if let loc = place?.location{
                annotation.coordinate = loc.coordinate
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            } 
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
