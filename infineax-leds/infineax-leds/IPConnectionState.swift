//
//  IPConnectionState.swift
//  infineax-leds
//
//  Created by Joshua Kelley on 8/26/16.
//  Copyright © 2016 Joshua David Kelley. All rights reserved.
//

import Foundation

/**

 Description: When the Infinite Peripherals SDK calls `connectionState`
 on its delegate, it passes back a 0, 1, or 2. We attempt to instantiate a
 `IPConnectionState` to verify that a valid value was returned.
 
 An `IPConnectionState` instance also knows how to pretty print its value
 by using the `toString` method.
 
 ---

 Type: Int32 Enum
 
 
 Cases:
 - Disconnected (rawValue: 0)
 - Connecting   (rawValue: 1)
 - Connected    (rawValue: 2)
 */
enum IPConnectionState: Int32 {
    
    case disconnected = 0
    case connecting = 1
    case connected = 2
    
    func toString() -> String {
        switch self {
        case .disconnected : return "Disconnected"
        case .connecting   : return "Connecting"
        case .connected    : return "Connected"
        }
    }
}
