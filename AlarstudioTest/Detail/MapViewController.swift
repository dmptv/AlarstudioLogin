//
//  MapViewController.swift
//  AlarstudioTest
//
//  Created by 123 on 26.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    var popRecognizer: InteractivePopRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapview()
        setInteractiveRecognizer()
    }
    
    private func setupMapview() {
        mapView = MKMapView()
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        view.addSubview(mapView)
        mapView.pinEdgesToSafeArea(of: view)

        
        let cafe = Cafe(filename: "Cafe")
        
        let region = MKCoordinateRegion(center: cafe.midCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
         mapView.setRegion(region, animated: true)
        
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = cafe.midCoordinate
        myAnnotation.title = "Current location"
        mapView.addAnnotation(myAnnotation)
        
    }

    private func setInteractiveRecognizer() {
        guard let controller = navigationController else { return }
        popRecognizer = InteractivePopRecognizer(controller: controller)
        controller.interactivePopGestureRecognizer?.delegate = popRecognizer
        navigationController?.setNavigationBarHidden(true, animated: false)
    }


}




























