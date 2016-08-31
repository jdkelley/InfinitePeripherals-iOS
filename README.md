# Welcome to the Infinea X SDK using Swift Explained #

This is a sample iOS application demonstrating the control of LED arrays on a Infinite Peripherals device that uses the DTDevices SDK. These examples were developed using the Infinea X.

This example exists to supplement incomplete or insufficient documentation around the DTDevices SDK. 

## Controlling LED Array Example ##

### Getting Started ###

1. Clone the repository 

```
$ git clone https://github.com/jdkelley/InfineaX-ControlLEDs.git
```

2. Add Dependencies
    * If you do not have a developer account with Infinite Peripherals, [create one](https://developer.ipcmobile.com/).
    * [Download](https://developer.ipcmobile.com/downloads/?showcat=Infinea) the latest version of the DTDevices SDK under "Infinea X."
    * Open the example's Xcode project file.
    * Drag the libdtdev.a file from SDK's Library directory to the Library group in the example's Xcode project.

3. Build and run the project.

## How it works ##

The SDK controls the LED arrays by passing a bit mask (as a ```UInt32```) to the ```uiControlLEDsWithBitMask``` instance method on the ```DTDevices``` object.

The bit mask is a three bit bit mask where the first bit controls the green LED array, the second bit controls the red LED array, and the third bit controls the blue LED array. The follow diagram illustrates this. 
  
  ![](/docs/breakdown.png)
  
To turn on the green LED arrays, pass 001 to ```uiControlLEDsWithBitMask```.
  
  ![](/docs/green.png)

Likewise, to turn on the blue LED arrays, pass 100 to ```uiControlLEDsWithBitMask```. 
  
  ![](/docs/blue.png)
  
Because all three LED arrays are independent and nearly on top of each other, you can use a superposition of these Red, Green, and Blue color states to simulate other colors. For example, passing 011 (or 3) will turn on the red array and the green array resulting in a color close to orange. 
  
  ![](/docs/orange.png)
  
Simply passing 0 to ```uiControlLEDsWithBitMask``` will turn off the LEDs.

Resulting illuminated LEDs having passed 001 to ```uiControlLEDsWithBitMask```.

  ![](/docs/operation.jpg)

## Who do I talk to? ##

If you have a Infinea X feature you would like to see added or have an example, feel free to create a pull request or [Email Us](mailto:infineaxexamples@gmail.com?Subject=Infinea%20X%20Example%20Suggestion).

## License ##

These Examples are released under the [MIT License](http://www.opensource.org/licenses/MIT).
