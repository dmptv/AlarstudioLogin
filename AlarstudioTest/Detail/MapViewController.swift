//
//  MapViewController.swift
//  AlarstudioTest
//
//  Created by 123 on 26.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit
import MapKit
import Spring

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    var popRecognizer: InteractivePopRecognizer?
    var cafe: Cafe!
    var mcDonald: McDonald!
    
    lazy var btnToCafe: SpringButton = {
        let btn = SpringButton(spring: "", borderColor: UIColor.mainBlue())
        btn.addTarget(self, action: #selector(backToCafe), for: .touchUpInside)
        btn.backgroundColor = UIColor.mainBlue()
        return btn
    }()
    
    @objc private func backToCafe() {
        setRegion()
    
        btnToCafe.animation = AnimationPresets.Morph.rawValue
        btnToCafe.curve = AnimationCurves.EaseInOut.rawValue
        btnToCafe.duration = 0.1
        btnToCafe.force = 0.3
        btnToCafe.animate()
    }
    
    fileprivate func setRegion() {
        let region = MKCoordinateRegion(center: cafe.midCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
    }
    
    init(_ mc: McDonald) {
        self.mcDonald = mc
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        self.cafe = Cafe(mc: mcDonald)
        setRegion()
        
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = cafe.midCoordinate
        myAnnotation.title = cafe.name
        mapView.addAnnotation(myAnnotation)
        
        setContsraints()
    }
    
    fileprivate func setContsraints() {
        mapView.addSubview(btnToCafe)
        
        btnToCafe.setAnchor(top: nil, left: nil, bottom: mapView.bottomAnchor, right: mapView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -30, paddingRight: 20)
        btnToCafe.setAnchor(width: 40, height: 40)
    }

    private func setInteractiveRecognizer() {
        guard let controller = navigationController else { return }
        popRecognizer = InteractivePopRecognizer(controller: controller)
        controller.interactivePopGestureRecognizer?.delegate = popRecognizer
        navigationController?.setNavigationBarHidden(true, animated: false)
    }


}




























