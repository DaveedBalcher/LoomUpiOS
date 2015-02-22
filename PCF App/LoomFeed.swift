//
//  LoomFeed.swift
//  PCF App
//
//  Created by David Balcher on 2/21/15.
//  Copyright (c) 2015 David Balcher. All rights reserved.
//

import UIKit

struct LoomFeed {
    
    var currentOccupancy: Int
    var message: String
    var time: String
    var location: String
    var typeOfUser: String
    var adText: String
    var locationImage: UIImage?
    
//    init(loomDictionary: NSDictionary) {
//        let currentLoom = loomDictionary["currently"] as NSDictionary
//        
//        currentOccupancy = currentLoom["currentOccupancy"] as Int
//        message = currentLoom["message"] as String
//        time = currentLoom["time"] as String
//        location = currentLoom["location"] as String
//        typeOfUser = currentLoom["typeOfUser"] as String
//        adText = currentLoom["adText"] as String
//        locationImage = currentLoom["locationImage"] as UIImage?
//    }

    init(currentOccupancy: Int, message: String, time:String, location:String, typeOfUser:String, adText:String, locationImage:UIImage) {
        self.currentOccupancy = currentOccupancy
        self.message = message
        self.time = time
        self.location = location
        self.typeOfUser = typeOfUser
        self.adText = adText
        self.locationImage = locationImage
    }

    
    
    
}
