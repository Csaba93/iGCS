//
//  MapViewController.swift
//  GCSCommon
//
//  Created by Csaba Nádasi on 2017. 01. 24..
//  Copyright © 2017. csaba.nadasi. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate
{
    @IBOutlet weak var flightMap: MKMapView!
    
    var timer = Timer()
    let ann = MKPointAnnotation()
    var coord = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double(conn.globalPosition!.lat())/10000000.0), longitude: CLLocationDegrees(Double(conn.globalPosition!.lon())/10000000.0))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.flightMap.delegate = self
        
       timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(mapRefresh), userInfo: nil, repeats: true)
        
        let pin = Map(lat: Double(conn.globalPosition!.lat())/10000000.0, lon: Double(conn.globalPosition!.lon())/10000000.0)
        
        var polyline = MKPolyline(coordinates: pin.coordinationArrayMake(), count: pin.coordinationArrayMake().count)

        self.flightMap.setRegion(pin.region!, animated: false)
        //self.flightMap.addAnnotation(pin.annotation)
        self.flightMap.addAnnotations(pin.annotationArrayMake())
        self.flightMap.add(polyline)
    }
    
    // MARK: - Plane moving
    
    func mapRefresh()
    {
               if Double(conn.globalPosition!.lat())/10000000.0 != coord.latitude || Double(conn.globalPosition!.lon())/10000000.0 != coord.longitude
        {
            self.coord = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double(conn.globalPosition!.lat())/10000000.0), longitude: CLLocationDegrees(Double(conn.globalPosition!.lon())/10000000.0))
            if ann.coordinate != nil
            {
                self.flightMap.removeAnnotation(ann)
            }
            ann.coordinate = self.coord
            self.flightMap.addAnnotation(ann)
        }
    }
   
    // MARK: - Delegate functions
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer
    {
        if overlay is MKPolyline {
            var polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.red
            polylineRenderer.lineWidth = 2
            return polylineRenderer
        }
        return MKPolylineRenderer()
    }

   /* func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView: MKAnnotationView?
       
        
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "Plane")
        }
        
        return annotationView
    }*/
}
