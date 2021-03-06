//
//  AKAdditiveCosines.m
//  AudioKit
//
//  Auto-generated from scripts by Aurelius Prochazka on 12/14/14.
//  Copyright (c) 2014 Hear For Yourself. All rights reserved.
//
//  Implementation of Csound's gbuzz:
//  http://www.csounds.com/manual/html/gbuzz.html
//

#import "AKAdditiveCosines.h"
#import "AKManager.h"

@implementation AKAdditiveCosines
{
    AKFTable *_cosineTable;
}

- (instancetype)initWithCosineTable:(AKFTable *)cosineTable
                     harmonicsCount:(AKControl *)harmonicsCount
                 firstHarmonicIndex:(AKControl *)firstHarmonicIndex
                  partialMultiplier:(AKControl *)partialMultiplier
               fundamentalFrequency:(AKParameter *)fundamentalFrequency
                          amplitude:(AKParameter *)amplitude
                              phase:(AKConstant *)phase
{
    self = [super initWithString:[self operationName]];
    if (self) {
        _cosineTable = cosineTable;
        _harmonicsCount = harmonicsCount;
        _firstHarmonicIndex = firstHarmonicIndex;
        _partialMultiplier = partialMultiplier;
        _fundamentalFrequency = fundamentalFrequency;
        _amplitude = amplitude;
        _phase = phase;
        
    }
    return self;
}

- (instancetype)initWithCosineTable:(AKFTable *)cosineTable
{
    self = [super initWithString:[self operationName]];
    if (self) {
        _cosineTable = cosineTable;
        
        // Default Values
        _harmonicsCount = akp(10);
        _firstHarmonicIndex = akp(1);
        _partialMultiplier = akp(1);
        _fundamentalFrequency = akp(220);
        _amplitude = akp(1);
        _phase = akp(0);
    }
    return self;
}

+ (instancetype)audioWithCosineTable:(AKFTable *)cosineTable
{
    return [[AKAdditiveCosines alloc] initWithCosineTable:cosineTable];
}

- (void)setOptionalHarmonicsCount:(AKControl *)harmonicsCount {
    _harmonicsCount = harmonicsCount;
}

- (void)setOptionalFirstHarmonicIndex:(AKControl *)firstHarmonicIndex {
    _firstHarmonicIndex = firstHarmonicIndex;
}

- (void)setOptionalPartialMultiplier:(AKControl *)partialMultiplier {
    _partialMultiplier = partialMultiplier;
}

- (void)setOptionalFundamentalFrequency:(AKParameter *)fundamentalFrequency {
    _fundamentalFrequency = fundamentalFrequency;
}

- (void)setOptionalAmplitude:(AKParameter *)amplitude {
    _amplitude = amplitude;
}

- (void)setOptionalPhase:(AKConstant *)phase {
    _phase = phase;
}
- (NSString *)stringForCSD {
    return [NSString stringWithFormat:
            @"%@ gbuzz %@, %@, %@, %@, %@, %@, %@",
            self,
            _amplitude,
            _fundamentalFrequency,
            _harmonicsCount,
            _firstHarmonicIndex,
            _partialMultiplier,
            _cosineTable,
            _phase];
}

@end
