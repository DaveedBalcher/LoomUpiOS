//
//  SampleLocation.swift
//  PCF App
//
//  Created by David Balcher on 2/22/15.
//  Copyright (c) 2015 David Balcher. All rights reserved.
//

import UIKit

class SampleLocation {
    var adText: String
    var locationName: String
    var locationImage: UIImage?
    var crowdMeterIcon: UIImage?
    
    init (adText: String, locationName: String, locationImageString: String, crowdIconInt: Int) {
        self.adText = adText
        self.locationName = locationName
        self.locationImage = locationImageFromString(locationImageString)
        self.crowdMeterIcon = crowdIconFromString(crowdIconInt)
    }
    
    func locationImageFromString(locationImageString: String) -> UIImage {
        var imageName: String
        
        switch locationImageString {
        case "creese":
            imageName = "creese"
        case "mandel":
            imageName = "mandell"
        default:
            imageName = "creese"
        }
        
        var Image = UIImage(named: imageName)
        return Image!
    }
    
    func crowdIconFromString(crowdIconInt: Int) -> UIImage {
        var imageName: String
        
        switch crowdIconInt {
        case 1:
            imageName = "crowdOfOne"
        case 2:
            imageName = "crowdOfTwo"
        case 3:
            imageName = "crowdOfThree"
        case 4:
            imageName = "crowdOfFour"
        case 5:
            imageName = "crowdOfFive"
        default:
            imageName = "crowdOfFour"
        }
        
        var Icon = UIImage(named: imageName)
        return Icon!
    }
}