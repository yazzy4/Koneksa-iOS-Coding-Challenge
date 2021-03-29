# Koneksa iOS Coding Challenge

Please read this entire document before starting any work.

## Requirements

We require a simple app that:
1. Records accelerometer data at 50 Hz for 10 seconds
1. Displays the real-time values on screen
1. Writes the values to disk when the time expires.

Implementation of the UI must be done in SwiftUI. Do not use UIKit or Storyboards. Ensure that you select SwiftUI
when creating a new project in Xcode.
There is no UI design for this app so feel free to place the required UI elements where you please. You will not be evaluated on your design skills.

## UI Elements
- [X] Start Button
- [X] X, Y, Z value labels

## UI States

INITIAL STATE 
- [X] Display a Start Button that, when tapped, will begin the accelerometer recording at 50 Hz.
- [ ] The Start Button should be hidden while in Active State

ACTIVE STATE
- [ ] Display the real-time accelerometer X, Y, Z values on screen.
- [ ] The X, Y, Z values should be hidden in the Initial State
- [ ] When the duration expires, write all the recorded accelerometer x,y,z values to the Documents Directory in whatever format you like, then return to the Initial State.

## Remarks

By design, this is a fairly simple exercise, so we're hoping for solutions that reflect what you consider well-factored production-quality code. The best solutions will be elegant, as well as correct. 
