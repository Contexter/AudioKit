//
//  main.swift
//  AudioKit
//
//  Auto-generated from scripts by Aurelius Prochazka on 12/14/14.
//  Copyright (c) 2014 Hear For Yourself. All rights reserved.
//

import Foundation

class Instrument : AKInstrument {

    override init() {
        super.init()

        let operation = AKLine()
        connect(operation)
        
        let oscillator = AKOscillator()
        oscillator.frequency = operation.scaledBy(100.ak)
        connect(oscillator)
        
        connect(AKAudioOutput(audioSource:oscillator))
    }
}

// Set Up
let instrument = Instrument()
AKOrchestra.addInstrument(instrument)
AKOrchestra.test()

while(AKManager.sharedManager().isRunning) {} //do nothing
println("Test complete!")
