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
    
    // MARK: Actions
    
    @IBAction func switchToggled(_ sender: AnyObject) {
        var mask: UInt32 = 0
        if greenSwitch.isOn {
            mask += 1
        }
        if redSwitch.isOn {
            mask += 2
        }
        if blueSwitch.isOn {
            mask += 4
        }
        log("Mask (\(mask)) Sent: \(String(mask, radix: 2))")
        
        passLEDMask(mask)
    }
    
    // MARK: View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        device.addDelegate(self)
        device.connect()

    }

    fileprivate func log(_ text: String) {
        NSLog(text)
        loggingTextView.text.append("\r\n" + "\(Date()) > " + text)
    }
}

extension ViewController : DTDeviceDelegate {
    
    func passLEDMask(_ mask: UInt32) {
        do {
            try device.uiControlLEDs(withBitMask: mask)
        } catch {
            log("Could not set LED")
        }
    }
    
    // Gets called by DTDevices every time the connectionState changes.
    func connectionState(_ state: Int32) {
        guard let newState = IPConnectionState(rawValue: state) else {
            return
        }
        
        connectionStateLabel.text = newState.toString()
        
        log("Connection State: \(newState.toString())")
    }
}
