//
//  UnitGenSoundGenerator.m
//  ExampleProject
//
//  Created by Adam Boulanger on 6/7/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "UnitGenSoundGenerator.h"

#import "CSDSineTable.h"
#import "CSDParam.h"
#import "CSDParamArray.h"

typedef enum
{
    kPValuePitchTag = 4
}kPValueTag;

@implementation UnitGenSoundGenerator

-(id)initWithOrchestra:(CSDOrchestra *)newOrchestra
{
    self = [super initWithOrchestra:newOrchestra];
    if (self) {
        //H4Y - ARB: create sign function with variable partial strengths
        float partialStrengths[] = {1.0f, 0.5f, 1.0f};

        CSDParamArray * partialStrengthParamArray = [CSDParamArray paramArrayFromFloats:partialStrengths count:3];
        
        CSDSineTable * sineTable = [[CSDSineTable alloc] initWithTableSize:4096 PartialStrengths:partialStrengthParamArray];
        [self addFunctionTable:sineTable];
        
        //NOTE:  duration of unitgenerator set from p3 with NOTE_DURATION_PVALUE
        myLine = [[CSDLine alloc] initWithIStartingValue:[CSDParamConstant paramWithFloat:0.5] 
                                               iDuration:[CSDParamConstant paramWithPValue:kPValueTagDuration]   
                                            iTargetValue:[CSDParamConstant paramWithInt:1.5]];
        [self addOpcode:myLine];
        
        //Init LineSegment_a, without CSDParamArray Functions like line
        myLineSegment_a = [[CSDLineSegment alloc] initWithIFirstSegmentStartValue:[CSDParamConstant paramWithInt:110]
                                                            iFirstSegmentDuration:[CSDParamConstant paramWithPValue:kPValueTagDuration] 
                                                        iFirstSegementTargetValue:[CSDParamConstant paramWithInt:330]];
        
        //Init LineSegment_b, includes CSDParamArray and behaves like breakpoint generator
        //NOTE: paramAray shouldn't just be initFromFloats, but should incorporate CSDParam 
        //NOTE: need to do math on duration(p3) especially to calculate breakpoint durations
        float breakpoints[] = {3.0f, 1.5f, 3.0f, 0.5};
        CSDParamArray * breakpointParamArray = [CSDParamArray paramArrayFromFloats:breakpoints count:4];
        myLineSegment_b = [[CSDLineSegment alloc] initWithIFirstSegmentStartValue:[CSDParamConstant paramWithFloat:0.5]
                                                          //iFirstSegmentDuration:[CSDParamConstant paramWithPValue:(kPValueTagDuration / 3)
                                                            iFirstSegmentDuration:[CSDParamConstant paramWithInt:3]
                                                        iFirstSegementTargetValue:[CSDParamConstant paramWithFloat:0.2] 
                                                                     SegmentArray:breakpointParamArray];
        [self addOpcode:myLineSegment_a];
        [self addOpcode:myLineSegment_b];
        
        //H4Y - ARB: create fmOscillator with sine, lines for pitch, modulation, and modindex
        myFMOscillator = [[CSDFoscili alloc] 
                initFMOscillatorWithAmplitude:[CSDParamConstant paramWithFloat:0.4] 
                                       kPitch:[myLineSegment_a output]
                                     kCarrier:[CSDParamConstant paramWithInt:1]
                                  xModulation:[myLine output]
                                    kModIndex:[myLineSegment_b output]
                                FunctionTable:sineTable 
                             AndOptionalPhase:nil];
        
        [self addOpcode:myFMOscillator];
        CSDOutputMono * monoOutput = [[CSDOutputMono alloc] initWithInput:[myFMOscillator output]]; 
        [self addOpcode:monoOutput];
    }
    return self;
}

-(void)playNoteForDuration:(float)dur 
{
    int instrumentNumber = [[orchestra instruments] indexOfObject:self] + 1;
    NSString * note = [NSString stringWithFormat:@"%0.2f", dur];
    [[CSDManager sharedCSDManager] playNote:note OnInstrument:instrumentNumber];

}

@end