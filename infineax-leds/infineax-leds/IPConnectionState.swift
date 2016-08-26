//
//  IPConnectionState.swift
//  infineax-leds
//
//  Created by Joshua Kelley on 8/26/16.
//  Copyright © 2016 Joshua David Kelley. All rights reserved.
//

import Foundation

enum IPConnectionState: Int32 {
    
    case Disconnected = 0
    case Connecting = 1
    case Connected = 2
    
    func toString() -> String {
        switch self {
        case Disconnected : return "Disconnected"
        case Connecting   : return "Connecting"
        case Connected    : return "Connected"
        }
    }
}
