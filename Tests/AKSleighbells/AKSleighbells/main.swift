//
//  main.swift
//  AudioKit
//
//  Auto-generated from scripts by Aurelius Prochazka on 12/17/14.
//  Customized by Aurelius Prochazka on 12/17/14.  (Added notes.)
//  Copyright (c) 2014 Hear For Yourself. All rights reserved.
//

import Foundation

class Instrument : AKInstrument {
    
    override init() {
        super.init()
        
        let note = Note()
        addNoteProperty(note.intensity)
        addNoteProperty(note.dampingFactor)
        addNoteProperty(note.mainResonantFrequency)
        addNoteProperty(note.firstResonantFrequency)
        addNoteProperty(note.secondResonantFrequency)
        
        let operation = AKSleighbells()
        operation.intensity = note.intensity
        operation.dampingFactor = note.dampingFactor
        operation.mainResonantFrequency = note.mainResonantFrequency
        operation.firstResonantFrequency = note.firstResonantFrequency
        operation.secondResonantFrequency = note.secondResonantFrequency
        connect(operation)
        
        connect(AKAudioOutput(audioSource:operation))
    }
}

class Note: AKNote {
    var intensity = AKNoteProperty()
    var dampingFactor = AKNoteProperty()
    var mainResonantFrequency = AKNoteProperty()
    var firstResonantFrequency = AKNoteProperty()
    var secondResonantFrequency = AKNoteProperty()
    
    override init() {
        super.init()
        addProperty(intensity)
        self.intensity.setValue(32)
        addProperty(dampingFactor)
        self.dampingFactor.setValue(0.2)
        addProperty(mainResonantFrequency)
        self.mainResonantFrequency.setValue(2500)
        addProperty(firstResonantFrequency)
        self.firstResonantFrequency.setValue(5300)
        addProperty(secondResonantFrequency)
        self.secondResonantFrequency.setValue(6500)
    }
}

// Set Up
let instrument = Instrument()
AKOrchestra.addInstrument(instrument)
AKManager.sharedManager().isLogging = true
AKOrchestra.testForDuration(10)

let note1 = Note()
// specify properties and create more notes here

let phrase = AKPhrase()
phrase.addNote(note1, atTime:1.0)
phrase.addNote(note1, atTime:1.25)
phrase.addNote(note1, atTime:1.5)
phrase.addNote(note1, atTime:2.0)
phrase.addNote(note1, atTime:2.25)
phrase.addNote(note1, atTime:2.5)
phrase.addNote(note1, atTime:3.0)
phrase.addNote(note1, atTime:3.25)
phrase.addNote(note1, atTime:3.5)
phrase.addNote(note1, atTime:3.875)
phrase.addNote(note1, atTime:4.0)

instrument.playPhrase(phrase)

while(AKManager.sharedManager().isRunning) {} //do nothing
println("Test complete!")
