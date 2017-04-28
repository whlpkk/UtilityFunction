//
//  WPTappableLabel.m
//  WPAttributedMarkupDemo
//
//  Created by Nigel Grange on 20/10/2014.
//  Copyright (c) 2014 Nigel Grange. All rights reserved.
//

#import "YZKTappableLabel.h"
#import <CoreText/CoreText.h>

@interface YZKTappableLabel ()

@property (nonatomic, assign) NSRange highlightedRange;

@end

@implementation YZKTappableLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        self.userInteractionEnabled = YES;
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        self.userInteractionEnabled = YES;
    }

    return self;
}

#pragma mark --

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pt     = [touch locationInView:self];

    // Locate the text attributes at the touched position
    [self textAttributesAtPoint:pt
                     completion:^(NSDictionary *attributes, NSRange range) {
                         // If the touched attributes contains our custom action style, execute the action block
                         YZKAttributedStyleAction *actionStyle = attributes[kYZKAttributedStyleAction];

                         if (actionStyle) {
                         if (actionStyle.beginAction) {
                         actionStyle.beginAction();
                         }
                         }
                     }];

    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pt     = [touch locationInView:self];

    // Locate the text attributes at the touched position
    [self textAttributesAtPoint:pt
                     completion:^(NSDictionary *attributes, NSRange range) {
                         // If the touched attributes contains our custom action style, execute the action block
                         YZKAttributedStyleAction *actionStyle = attributes[kYZKAttributedStyleAction];

                         if (actionStyle) {
                         if (actionStyle.moveAction) {
                         actionStyle.moveAction();
                         }
                         }
                     }];

    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pt     = [touch locationInView:self];

    // Locate the text attributes at the touched position
    [self textAttributesAtPoint:pt
                     completion:^(NSDictionary *attributes, NSRange range) {
                         // If the touched attributes contains our custom action style, execute the action block
                         YZKAttributedStyleAction *actionStyle = attributes[kYZKAttributedStyleAction];

                         if (actionStyle) {
                         if (actionStyle.endAction) {
                         actionStyle.endAction();
                         }
                         }
                     }];

    [super touchesEnded:touches withEvent:event];
}

- (void)highlightWordWithRange:(NSRange)range
{
    //highlight selected word
    if (NSEqualRanges(range, self.highlightedRange)) {
        NSMutableAttributedString *attributedString = [self.attributedText mutableCopy];
        [attributedString removeAttribute:NSBackgroundColorAttributeName range:range];
        [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:range];
        self.attributedText = attributedString;
    } else {
        [self removeHighlightWordWithRange];
    }
}

- (void)removeHighlightWordWithRange
{
    NSMutableAttributedString *attributedString = [self.attributedText mutableCopy];

    [attributedString removeAttribute:NSBackgroundColorAttributeName range:self.highlightedRange];
    self.attributedText = attributedString;
}

#pragma mark --

- (void)textAttributesAtPoint:(CGPoint)pt
                   completion:(void (^)(NSDictionary *attributes, NSRange range))completion
{
    // Locate the attributes of the text within the label at the specified point
    NSDictionary *dictionary = nil;
    NSRange attrRange;

    // First, create a CoreText framesetter
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.attributedText);

    CGMutablePathRef framePath = CGPathCreateMutable();

    CGPathAddRect(framePath, NULL, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    // Get the frame that will do the rendering.
    CFRange currentRange = CFRangeMake(0, 0);
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
    CGPathRelease(framePath);

    // Get each of the typeset lines
    NSArray *lines = (__bridge id)CTFrameGetLines(frameRef);

    CFIndex linesCount = [lines count];
    CGPoint *lineOrigins = (CGPoint *)malloc(sizeof(CGPoint) * linesCount);
    CTFrameGetLineOrigins(frameRef, CFRangeMake(0, linesCount), lineOrigins);

    // Correct each of the typeset lines (which have origin (0,0)) to the correct orientation (typesetting offsets from the bottom of the frame)

    CGFloat bottom = self.frame.size.height;

    for (CFIndex i = 0; i < linesCount; ++i) {
        lineOrigins[i].y = self.frame.size.height - lineOrigins[i].y;
        bottom = lineOrigins[i].y;
    }

    // Offset the touch point by the amount of space between the top of the label frame and the text
    pt.y -= (self.frame.size.height - bottom) / 2;

    CTLineRef line = NULL;
    CGPoint lineOrigin = CGPointZero;

    // Scan through each line to find the line containing the touch point y position
    for (CFIndex i = 0; i < linesCount; ++i) {
        line = (__bridge CTLineRef)[lines objectAtIndex:i];
        lineOrigin = lineOrigins[i];
        CGFloat descent, ascent;
        CGFloat width = CTLineGetTypographicBounds(line, &ascent, &descent, nil);

        if (pt.y < (floor(lineOrigin.y) + floor(descent))) {
            // Cater for text alignment set in the label itself (not in the attributed string)
            if (self.textAlignment == NSTextAlignmentCenter) {
                pt.x -= (self.frame.size.width - width) / 2;
            } else if (self.textAlignment == NSTextAlignmentRight) {
                pt.x -= (self.frame.size.width - width);
            }

            // Offset the touch position by the actual typeset line origin. pt is now the correct touch position with the line bounds
            pt.x -= lineOrigin.x;
            pt.y -= lineOrigin.y;

            // Find the text index within this line for the touch position
            CFIndex i = CTLineGetStringIndexForPosition(line, pt);

            // Iterate through each of the glyph runs to find the run containing the character index
            NSArray *glyphRuns = (__bridge id)CTLineGetGlyphRuns(line);
            CFIndex runCount = [glyphRuns count];

            for (CFIndex run = 0; run < runCount; run++) {
                CTRunRef glyphRun = (__bridge CTRunRef)[glyphRuns objectAtIndex:run];
                CFRange range = CTRunGetStringRange(glyphRun);

                if (i >= range.location && i <= range.location + range.length) {
                    dictionary = (__bridge NSDictionary *)CTRunGetAttributes(glyphRun);
                    attrRange.location = range.location;
                    attrRange.length   = range.length;
                    break;
                }
            }

            if (dictionary) {
                break;
            }
        }
    }

    free(lineOrigins);
    CFRelease(frameRef);
    CFRelease(framesetter);

    completion(dictionary, attrRange);
}

@end