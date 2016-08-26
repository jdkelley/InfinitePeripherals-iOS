//
//  ViewController.swift
//  infineax-leds
//
//  Created by Joshua Kelley on 8/26/16.
//  Copyright © 2016 Joshua David Kelley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var device = DTDevices()
    
    // MARK: Outlets

    @IBOutlet weak var connectionStateLabel: UILabel!
    
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    
    @IBOutlet weak var loggingTextView: UITextView!
    
    @IBAction func switchToggled(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        device.addDelegate(self)
        device.connect()
        
    }

    private func log(text: String) {
        NSLog(text)
        //textview.text.appendContentsOf("\r\n" + "\(NSDate()) > " + text)
    }
}

extension ViewController : DTDeviceDelegate {
    
    // Gets called by DTDevices every time the connectionState changes.
    func connectionState(state: Int32) {
        guard let newState = IPConnectionState(rawValue: state) else {
            return
        }
        
        connectionStateLabel.text = newState.toString()
        
        log("Connection State: \(newState.toString())")
    }
}
