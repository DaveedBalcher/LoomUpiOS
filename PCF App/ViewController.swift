//
//  ViewController.swift
//  PCF App
//
//  Created by David Balcher on 2/21/15.
//  Copyright (c) 2015 David Balcher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationTitleLabel: UILabel!
    @IBOutlet weak var adLabel: UILabel!
    @IBOutlet weak var crowdMeterIcon: UIImageView!
    

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var newLocationButton: UIButton!  

    // Setup TableView Variables
    @IBOutlet var locationFeedTableView: UITableView!
    @IBOutlet weak var messagingTextField: UITextField!
    
    let cellIdentifier = "messageCell"
    var loomMessages = [String]()
    var arrayOfMessages = [SampleMessage]()
    var currentTime = "1:05 PM"
    var timedMessagesStarted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register the UITableViewCell class with the tableView
        
        
        self.locationFeedTableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        
        locationFeedTableView.estimatedRowHeight = 44.0
        locationFeedTableView.rowHeight = UITableViewAutomaticDimension

        setUpSampleMessages()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func getCurrentLoomData() -> Void {
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            let tableEntry = "\(currentLoomFeed.message)        posted at \(currentLoomFeed.time)"
//            self.tableData.append(tableEntry)
//            self.locationFeedTableView.reloadData()
//
//            self.locationImageView.image = currentLoomFeed.locationImage
//            self.locationTitleLabel.text = "\(currentLoomFeed.location)"
//            self.adLabel.text = "\(currentLoomFeed.adText)"
//        })
//
//    }

    func setUpSampleMessages() {
        var message1 = SampleMessage(messagePosted: "Hi everyone", postTime: "1:00 PM")
        var message2 = SampleMessage(messagePosted: "Hi", postTime: "1:00 PM")
        var message3 = SampleMessage(messagePosted: "Where you at?", postTime: "1:01 PM")
        var message4 = SampleMessage(messagePosted: "Behrakis Hall", postTime: "1:01 PM")
        var message5 = SampleMessage(messagePosted: "When's Lunch?", postTime: "1:01 PM")
        var message6 = SampleMessage(messagePosted: "10 minutes", postTime: "1:03 PM")
        var message7 = SampleMessage(messagePosted: "Good to know", postTime: "1:03 PM")
        var message8 = SampleMessage(messagePosted: "Pizza again???", postTime: "1:04 PM")
        var message9 = SampleMessage(messagePosted: "Pizza Pizza Pizza Pizza Pizza Pizza Pizza Pizza Pizza Pizza Pizza Pizza" , postTime: "1:04 PM")

        arrayOfMessages.append(message9)
        arrayOfMessages.append(message8)
        arrayOfMessages.append(message7)
        arrayOfMessages.append(message6)
        arrayOfMessages.append(message5)
        arrayOfMessages.append(message4)
        arrayOfMessages.append(message3)
        arrayOfMessages.append(message2)
        arrayOfMessages.append(message1)
        
    }
    
    func setUpSampleTimedMessages() {

        let delay = 2.5 * Double(NSEC_PER_SEC)
        
        delayedMessage("Hi everyone", postTime: "1:06 PM" , delay: delay)
        delayedMessage("Hi", postTime: "1:06 PM" , delay: delay*1.2)
        delayedMessage("Where you at?", postTime: "1:06 PM" , delay: delay*2.0)
        delayedMessage("Behrakis Hall", postTime: "1:06 PM" , delay: delay*2.3)
        delayedMessage("Philly Codefest", postTime: "1:07 PM" , delay: delay*3.0)
        delayedMessage("When's Lunch?", postTime: "1:07 PM" , delay: delay*5.0)
        delayedMessage("10 minutes", postTime: "1:07 PM" , delay: delay*5.2)
        delayedMessage("Good to know", postTime: "1:08 PM" , delay: delay*6.5)
        delayedMessage("Pizza again???", postTime: "1:08 PM" , delay: delay*7.0)
        
        var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay*8))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.updateLocationChange("2 Burgers 4 the Price of 1 at ShakeShake" , locationName: "Drexel: Mandel Theater", locationImageString: "mandel", crowdIconInt: 2)
        }
        
        delayedMessage("Hi everyone", postTime: "1:06 PM" , delay: delay*9)
        delayedMessage("Hi", postTime: "1:06 PM" , delay: delay*9.2)
        delayedMessage("Where you at?", postTime: "1:06 PM" , delay: delay*9.7)
        delayedMessage("Behrakis Hall", postTime: "1:06 PM" , delay: delay*10.7)
        delayedMessage("Philly Codefest", postTime: "1:07 PM" , delay: delay*11.2)
        delayedMessage("When's Lunch?", postTime: "1:07 PM" , delay: delay*11.5)
        delayedMessage("10 minutes", postTime: "1:07 PM" , delay: delay*12.2)
        delayedMessage("Good to know", postTime: "1:08 PM" , delay: delay*12.5)
        delayedMessage("Pizza again???", postTime: "1:08 PM" , delay: delay*13.5)
        
        time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay*14))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.updateLocationChange("Free Starbucks Until 4pm: Click Here" , locationName: "Drexel: Creese Center", locationImageString: "creese", crowdIconInt: 4)
        }
    }

    // UITableViewDataSource methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMessages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as MessageCell
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.whiteColor()
        } else {
            cell.backgroundColor = UIColor(netHex:0xF5F5F5)
        }
        
        let message = arrayOfMessages[indexPath.row]
        cell.setCell(message.messagePosted, postTime: message.postTime)

        return cell
    }
    
    func delayedMessage(messagePosted: String, postTime: String, delay: Double){
        var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            let message = self.addCell(messagePosted, postTime: postTime)
            self.currentTime = message.postTime
            self.locationFeedTableView.reloadData()
        }
    }
    
    func addCell(messagePosted: String , postTime: String) -> SampleMessage {
        arrayOfMessages.insert(SampleMessage(messagePosted: messagePosted , postTime: postTime)
, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.locationFeedTableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        return SampleMessage(messagePosted: messagePosted , postTime: postTime)
    }

    
    @IBAction func sendMessage(sender: AnyObject) {
        if let message = messagingTextField!.text{
            addCell(message, postTime:currentTime)
            locationFeedTableView.reloadData()
        } else {
            println("Error: nil message entered")
        }
        if(!timedMessagesStarted) {
            timedMessagesStarted = true
            println("True")
            setUpSampleTimedMessages()
        }
    }
    
    func updateLocationChange(adText: String , locationName: String, locationImageString: String, crowdIconInt: Int) {
        var newLocation = SampleLocation(adText: adText , locationName: locationName, locationImageString: locationImageString, crowdIconInt: crowdIconInt)
        locationImageView.image = newLocation.locationImage
        locationTitleLabel.text = newLocation.locationName
        adLabel.text = newLocation.adText
        crowdMeterIcon.image = newLocation.crowdMeterIcon
        
    }


    // UITableViewDelegate methods
    
//    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
//        
//        let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
//        
//        alert.addAction(UIAlertAction(title: "OK",
//            style: UIAlertActionStyle.Default,
//            handler: {
//                (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped!")
//        }))
//        
//        self.presentViewController(alert, animated: true, completion: nil)
//        
//    }

}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
