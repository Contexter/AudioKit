//
//  AKPhasor.m
//  AudioKit
//
//  Auto-generated from scripts by Aurelius Prochazka on 12/3/14.
//  Copyright (c) 2014 Hear For Yourself. All rights reserved.
//
//  Implementation of Csound's phasor:
//  http://www.csounds.com/manual/html/phasor.html
//

#import "AKPhasor.h"
#import "AKManager.h"

@implementation AKPhasor

- (instancetype)initWithFrequency:(AKParameter *)frequency
                            phase:(AKConstant *)phase
{
    self = [super initWithString:[self operationName]];
    if (self) {
            _frequency = frequency;
                _phase = phase;
        
    }
    return self;
}

- (instancetype)init
{
    self = [super initWithString:[self operationName]];
    if (self) {
        
    // Default Values   
            _frequency = akp(440);        
            _phase = akp(0);            
    }
    return self;
}

+ (instancetype)audio
 {
    return [[AKPhasor alloc] init];
}

- (void)setOptionalFrequency:(AKParameter *)frequency {
    _frequency = frequency;
}

- (void)setOptionalPhase:(AKConstant *)phase {
    _phase = phase;
}

- (NSString *)stringForCSD {
        return [NSString stringWithFormat:
            @"%@ phasor %@, %@",
            self,
            _frequency,
            _phase];
}


@end
