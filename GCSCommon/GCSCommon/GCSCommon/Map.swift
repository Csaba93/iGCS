//
//  Map.swift
//  GCSCommon
//
//  Created by Csaba Nádasi on 2017. 01. 26..
//  Copyright © 2017. csaba.nadasi. All rights reserved.
//

import UIKit
import MapKit

class Map: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    let latDelta:CLLocationDegrees = 0.01
    let lonDelta:CLLocationDegrees = 0.01
    let span:MKCoordinateSpan?
    var region:MKCoordinateRegion?
    var annotation = MKPointAnnotation()
    
    init(lat: Double, lon: Double)
    {
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        self.coordinate = coordinate
        span = MKCoordinateSpanMake(latDelta, lonDelta)
        region = MKCoordinateRegionMake(coordinate, span!)
        annotation.coordinate = coordinate
    }
    
    func annotationArrayMake() -> [MKPointAnnotation]
    {
        var annotationArray = [MKPointAnnotation]()
        
        for itemAnnotation in conn.missionItems
        {
            let location = CLLocationCoordinate2D(latitude: Double(itemAnnotation.x()), longitude: Double(itemAnnotation.y()))
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = String(itemAnnotation.seq())
            annotation.subtitle = "Height: " + String(itemAnnotation.z())
            annotationArray.append(annotation)
        }
        
        annotationArray.removeFirst()
        annotationArray.removeLast()
        
        return annotationArray
    }
    
    func coordinationArrayMake() -> [CLLocationCoordinate2D]
    {
        var coordinationArray = [CLLocationCoordinate2D]()
        
        for itemAnnotation in conn.missionItems
        {
            let location = CLLocationCoordinate2D(latitude: Double(itemAnnotation.x()), longitude: Double(itemAnnotation.y()))
            coordinationArray.append(location)
        }
        
        coordinationArray.removeFirst()
        coordinationArray.removeLast()
        
        return coordinationArray
    }
}
