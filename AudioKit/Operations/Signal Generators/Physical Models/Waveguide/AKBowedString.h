//
//  AKBowedString.h
//  AudioKit
//
//  Auto-generated from scripts by Aurelius Prochazka on 11/30/14.
//  Copyright (c) 2014 Hear For Yourself. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** Creates a tone similar to a bowed string.
 
 Audio output is a tone similar to a bowed string, using a physical model developed from Perry Cook, but recoded for Csound.
 */

@interface AKBowedString : AKAudio

/// Instantiates the bowed string with all values
/// @param frequency Frequency of the note played, note that this will be lowest allowable frequency unless the optional minimum frequency is set.
/// @param pressure Parameter controlling the pressure of the bow on the string. Values should be about 3. The useful range is approximately 1 to 5.
/// @param position Position of the bow along the string. Usual playing is about 0.127236. The suggested range is 0.025 to 0.23.
/// @param vibratoShapeTable Table shape of vibrato, usually a sine table.
/// @param vibratoFrequency Frequency of vibrato in Hertz. Suggested range is 0 to 12.
/// @param vibratoAmplitude Amplitude of the vibrato.
/// @param minimumFrequency Lowest frequency at which the instrument will play.
- (instancetype)initWithFrequency:(AKControl *)frequency
                         pressure:(AKControl *)pressure
                         position:(AKControl *)position
                vibratoShapeTable:(AKFTable *)vibratoShapeTable
                 vibratoFrequency:(AKControl *)vibratoFrequency
                 vibratoAmplitude:(AKControl *)vibratoAmplitude
                 minimumFrequency:(AKConstant *)minimumFrequency;

/// Instantiates the bowed string with default values
- (instancetype)init;


/// Instantiates the bowed string with default values
+ (instancetype)audio;




/// Frequency of the note played, note that this will be lowest allowable frequency unless the optional minimum frequency is set. [Default Value: 110]
@property AKControl *frequency;

/// Set an optional frequency
/// @param frequency Frequency of the note played, note that this will be lowest allowable frequency unless the optional minimum frequency is set. [Default Value: 110]
- (void)setOptionalFrequency:(AKControl *)frequency;


/// Parameter controlling the pressure of the bow on the string. Values should be about 3. The useful range is approximately 1 to 5. [Default Value: 3]
@property AKControl *pressure;

/// Set an optional pressure
/// @param pressure Parameter controlling the pressure of the bow on the string. Values should be about 3. The useful range is approximately 1 to 5. [Default Value: 3]
- (void)setOptionalPressure:(AKControl *)pressure;


/// Position of the bow along the string. Usual playing is about 0.127236. The suggested range is 0.025 to 0.23. [Default Value: 0.127236]
@property AKControl *position;

/// Set an optional position
/// @param position Position of the bow along the string. Usual playing is about 0.127236. The suggested range is 0.025 to 0.23. [Default Value: 0.127236]
- (void)setOptionalPosition:(AKControl *)position;


/// Table shape of vibrato, usually a sine table. [Default Value: sine]
@property AKFTable *vibratoShapeTable;

/// Set an optional vibrato shape table
/// @param vibratoShapeTable Table shape of vibrato, usually a sine table. [Default Value: sine]
- (void)setOptionalVibratoShapeTable:(AKFTable *)vibratoShapeTable;


/// Frequency of vibrato in Hertz. Suggested range is 0 to 12. [Default Value: 0]
@property AKControl *vibratoFrequency;

/// Set an optional vibrato frequency
/// @param vibratoFrequency Frequency of vibrato in Hertz. Suggested range is 0 to 12. [Default Value: 0]
- (void)setOptionalVibratoFrequency:(AKControl *)vibratoFrequency;


/// Amplitude of the vibrato. [Default Value: 0]
@property AKControl *vibratoAmplitude;

/// Set an optional vibrato amplitude
/// @param vibratoAmplitude Amplitude of the vibrato. [Default Value: 0]
- (void)setOptionalVibratoAmplitude:(AKControl *)vibratoAmplitude;


/// Lowest frequency at which the instrument will play.  [Default Value: 0]
@property AKConstant *minimumFrequency;

/// Set an optional minimum frequency
/// @param minimumFrequency Lowest frequency at which the instrument will play.  [Default Value: 0]
- (void)setOptionalMinimumFrequency:(AKConstant *)minimumFrequency;


@end
