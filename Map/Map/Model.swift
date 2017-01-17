//
//  Model.swift
//  Map
//
//  Created by Lucas BELVALETTE on 10/10/16.
//  Copyright © 2016 Lucas BELVALETTE. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ColorPointAnnotation: MKPointAnnotation {
    var pinColor: UIColor
    
    init(pinColor: UIColor) {
        self.pinColor = pinColor
        super.init()
    }
}

class Point {
    let name: String?
    let subTitle: String?
    let location: CLLocation?
    let color: UIColor?
    
    init (name: String, subTitle: String, location: CLLocation, color: UIColor) {
        self.name = name
        self.subTitle = subTitle
        self.location = location
        self.color = color
    }
}

struct Points {
    static let points: [Point] = [
        Point(name: "42", subTitle: "School with broken API...", location: CLLocation(latitude: 48.896684, longitude: 2.318376), color: UIColor.greenColor()),
        Point(name: "Amiens", subTitle: "Ville perdu", location: CLLocation(latitude: 49.894067, longitude: 2.295753), color: UIColor.purpleColor()),
        Point(name: "Chatel", subTitle: "Life Goal", location: CLLocation(latitude: 46.267395, longitude: 6.841152), color: UIColor.orangeColor())
    ]
}
