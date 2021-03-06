//
//  AKSekere.h
//  AudioKit
//
//  Auto-generated from scripts by Aurelius Prochazka on 12/15/14.
//  Copyright (c) 2014 Hear For Yourself. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** Semi-physical model of a sekere sound.

 This is one of the PhISEM percussion opcodes. PhISEM (Physically Informed Stochastic Event Modeling) is an algorithmic approach for simulating collisions of multiple independent sound producing objects.
 */

@interface AKSekere : AKAudio
/// Instantiates the sekere with all values
/// @param count The number of beads, teeth, bells, timbrels, etc. If zero, the default value is 64. [Default Value: 64]
/// @param dampingFactor Damping factor where 0 is no damping and 1 is fully damped. [Default Value: 0.1]
- (instancetype)initWithCount:(AKConstant *)count
                dampingFactor:(AKConstant *)dampingFactor;

/// Instantiates the sekere with default values
- (instancetype)init;

/// Instantiates the sekere with default values
+ (instancetype)audio;

/// The number of beads, teeth, bells, timbrels, etc. If zero, the default value is 64. [Default Value: 64]
@property AKConstant *count;

/// Set an optional count
/// @param count The number of beads, teeth, bells, timbrels, etc. If zero, the default value is 64. [Default Value: 64]
- (void)setOptionalCount:(AKConstant *)count;
/// Damping factor where 0 is no damping and 1 is fully damped. [Default Value: 0.1]
@property AKConstant *dampingFactor;

/// Set an optional damping factor
/// @param dampingFactor Damping factor where 0 is no damping and 1 is fully damped. [Default Value: 0.1]
- (void)setOptionalDampingFactor:(AKConstant *)dampingFactor;



@end
