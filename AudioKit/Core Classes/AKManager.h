//
//  AKManager.h
//  AudioKit
//
//  Created by Aurelius Prochazka on 5/30/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "AKInstrument.h"
#import "AKOrchestra.h"
#import "AKEvent.h"
#import "AKMidi.h"
#import "AKSequence.h"
#import "AKSineTable.h"

/** The AKManager is a singleton class available to all controllers that need access to audio.
 */
@interface AKManager : NSObject

/// Determines whether or not AudioKit is available to send events to.
@property (readonly) BOOL isRunning;

/// Determines whether or not to log
@property BOOL isLogging;

/// The default orchestra
@property AKOrchestra *orchestra;

/// Common midi property shared across the application
@property (readonly) AKMidi *midi;

/// Common table required by many applications
@property AKSineTable *standardSineTable;
+ (AKSineTable *)standardSineTable;

@property NSString *fullPathToAudioKit;

/// @returns the shared instance of AKManager
+ (AKManager *)sharedManager;

/// Run AudioKit using an AKOrchestra
- (void)runOrchestra;

/// Run AudioKit using an AKOrchestra for a specific amount of time
/// @param duration Time for the orchestra to play in seconds
- (void)runOrchestraForDuration:(int)duration;

/// Test AudioKit by playing the first instrument for ten seconds
- (void)runTestOrchestra;

/// Stop AudioKit from making any more sound.
- (void)stop;

/// Triggers an AKEvent
/// @param event AKEvent to be triggered
- (void)triggerEvent:(AKEvent *)event;

/// Stop all notes of an instrument
/// @param instrument The instrument that needs to be turned off.
- (void)stopInstrument:(AKInstrument *)instrument;

/// Stop playback of a given note
/// @param note Note to stop
- (void)stopNote:(AKNote *)note;

/// Update playback of a given note
/// @param note Note to update
- (void)updateNote:(AKNote *)note;

/// Helper function to get the string out of a file.
/// @param filename Full path of file on disk
+ (NSString *)stringFromFile:(NSString *)filename;

/// Enable Audio Input
- (void)enableAudioInput;

/// Disable AudioInput
- (void)disableAudioInput;

- (void)stopRecording;
- (void)startRecordingToURL:(NSURL *)url;

/// Enable MIDI
- (void)enableMidi;

/// Disable MIDI
- (void)disableMidi;

@end
