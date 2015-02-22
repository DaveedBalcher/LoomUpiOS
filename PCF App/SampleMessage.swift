//
//  SampleMessage.swift
//  PCF App
//
//  Created by David Balcher on 2/22/15.
//  Copyright (c) 2015 David Balcher. All rights reserved.
//

import Foundation

class SampleMessage {
    var messagePosted: String
    var postTime: String
    
    init (messagePosted: String, postTime: String) {
        self.messagePosted = messagePosted
        self.postTime = postTime
    } 
}