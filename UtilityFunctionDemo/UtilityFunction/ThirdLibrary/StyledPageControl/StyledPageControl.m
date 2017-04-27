//
//  PageControl.m
//  PageControlDemo
//
/**
 * Created by honcheng on 5/14/11.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining 
 * a copy of this software and associated documentation files (the 
 * "Software"), to deal in the Software without restriction, including 
 * without limitation the rights to use, copy, modify, merge, publish, 
 * distribute, sublicense, and/or sell copies of the Software, and to 
 * permit persons to whom the Software is furnished to do so, subject 
 * to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be 
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT 
 * WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR 
 * PURPOSE AND NONINFRINGEMENT. IN NO EVENT 
 * SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
 * IN CONNECTION WITH THE SOFTWARE OR 
 * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * @author 		Muh Hon Cheng <honcheng@gmail.com> http://twitter.com/honcheng
 * @copyright	2011	Muh Hon Cheng
 * 
 */

#import "StyledPageControl.h"


#define COLOR_GRAYISHBLUE [UIColor colorWithRed:128/255.0 green:130/255.0 blue:133/255.0 alpha:1]
#define COLOR_GRAY [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1]

@implementation StyledPageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        
        self.strokeWidth = 2;
        self.gapWidth = 10;
        self.diameter = 12;
        self.pageControlStyle = PageControlStyleDefault;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapped:)];
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
}

- (void)onTapped:(UITapGestureRecognizer*)gesture
{
    CGPoint touchPoint = [gesture locationInView:[gesture view]];
    
    if (touchPoint.x < self.frame.size.width/2) {
        // move left
        if (self.currentPage>0)
            self.currentPage -= 1;
    }else {
        // move right
        if (self.currentPage<self.numberOfPages-1)
            self.currentPage += 1;
    }
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)drawRect:(CGRect)rect
{
    UIColor *coreNormalColor, *coreSelectedColor, *strokeNormalColor, *strokeSelectedColor;
    
    if (self.coreNormalColor) coreNormalColor = self.coreNormalColor;
    else coreNormalColor = COLOR_GRAYISHBLUE;
    
    if (self.coreSelectedColor) coreSelectedColor = self.coreSelectedColor;
    else
    {
        if (self.pageControlStyle==PageControlStyleStrokedCircle || self.pageControlStyle==PageControlStyleWithPageNumber)
        {
            coreSelectedColor = COLOR_GRAYISHBLUE;
        }
        else
        {
            coreSelectedColor = COLOR_GRAY;
        }
    }
    
    if (self.strokeNormalColor) strokeNormalColor = self.strokeNormalColor;
    else 
    {
        if (self.pageControlStyle==PageControlStyleDefault && self.coreNormalColor)
        {
            strokeNormalColor = self.coreNormalColor;
        }
        else
        {
            strokeNormalColor = COLOR_GRAYISHBLUE;
        }
    }
    
    if (self.strokeSelectedColor) strokeSelectedColor = self.strokeSelectedColor;
    else
    {
        if (self.pageControlStyle==PageControlStyleStrokedCircle || self.pageControlStyle==PageControlStyleWithPageNumber)
        {
            strokeSelectedColor = COLOR_GRAYISHBLUE;
        }
        else if (self.pageControlStyle==PageControlStyleDefault && self.coreSelectedColor)
        {
            strokeSelectedColor = self.coreSelectedColor;
        }
        else
        {
            strokeSelectedColor = COLOR_GRAY;
        }
    }
    
    // Drawing code
    if (self.hidesForSinglePage && self.numberOfPages==1)
	{
		return;
	}
	
	CGContextRef myContext = UIGraphicsGetCurrentContext();
	
	int gap = self.gapWidth;
    float diameter = self.diameter - 2*self.strokeWidth;
    
//    if (self.pageControlStyle==PageControlStyleThumb)
//    {
//        if (self.thumbImage && self.selectedThumbImage)
//        {
//            diameter = self.thumbImage.size.width;
//        }
//    }
	
	int totalWidth = self.numberOfPages * diameter + (self.numberOfPages-1)*gap;
	
    while (totalWidth>self.frame.size.width)
    {
        diameter -= 2;
        gap = diameter + 2;
        while (totalWidth>self.frame.size.width)
        {
            gap -= 1;
            totalWidth = self.numberOfPages*diameter + (self.numberOfPages-1)*gap;
            
            if (gap==2)
                break;
        }
        
        if (diameter==2)
            break;
    }
	
	int i;
	for (i=0; i<self.numberOfPages; i++)
	{
		int x = (self.frame.size.width-totalWidth)/2 + i*(diameter+gap);

        if (self.pageControlStyle==PageControlStyleDefault)
        {
            if (i== self.currentPage)
            {
                CGContextSetFillColorWithColor(myContext, [coreSelectedColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeSelectedColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
            else
            {
                CGContextSetFillColorWithColor(myContext, [coreNormalColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeNormalColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
        }
        else if (self.pageControlStyle==PageControlStyleStrokedCircle)
        {
            CGContextSetLineWidth(myContext, self.strokeWidth);
            if (i==self.currentPage)
            {
                CGContextSetFillColorWithColor(myContext, [coreSelectedColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeSelectedColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
            else
            {
                CGContextSetStrokeColorWithColor(myContext, [strokeNormalColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
        }
        else if (self.pageControlStyle==PageControlStyleWithPageNumber)
        {
            CGContextSetLineWidth(myContext, self.strokeWidth);
            if (i==self.currentPage)
            {
                int currentPageDiameter = diameter*1.6;
                x = (self.frame.size.width-totalWidth)/2 + i*(diameter+gap) - (currentPageDiameter-diameter)/2;
                CGContextSetFillColorWithColor(myContext, [coreSelectedColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-currentPageDiameter)/2,currentPageDiameter,currentPageDiameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeSelectedColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-currentPageDiameter)/2,currentPageDiameter,currentPageDiameter));
            
                NSString *pageNumber = [NSString stringWithFormat:@"%i", i+1];
                NSMutableParagraphStyle *pStyle = [[NSMutableParagraphStyle alloc] init];
                pStyle.lineBreakMode = NSLineBreakByCharWrapping;
                pStyle.alignment = NSTextAlignmentCenter;
                [pageNumber drawInRect:CGRectMake(x,(self.frame.size.height-currentPageDiameter)/2-1,currentPageDiameter,currentPageDiameter)
                        withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:currentPageDiameter-2],
                                         NSParagraphStyleAttributeName:pStyle,
                                         NSForegroundColorAttributeName:[UIColor whiteColor]
                                         }];
            }
            else
            {
                CGContextSetStrokeColorWithColor(myContext, [strokeNormalColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
        }
        else if (self.pageControlStyle==PageControlStylePressed1 || self.pageControlStyle==PageControlStylePressed2)
        {
            if (self.pageControlStyle==PageControlStylePressed1)
            {
                CGContextSetFillColorWithColor(myContext, [[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2-1,diameter,diameter));
            }
            else if (self.pageControlStyle==PageControlStylePressed2)
            {
                CGContextSetFillColorWithColor(myContext, [[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1] CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2+1,diameter,diameter));
            }
            
            
            if (i==self.currentPage)
            {
                CGContextSetFillColorWithColor(myContext, [coreSelectedColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeSelectedColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
            else
            {
                CGContextSetFillColorWithColor(myContext, [coreNormalColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeNormalColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
        }
        else if (self.pageControlStyle==PageControlStyleThumb)
        {
            if (self.thumbImage && self.selectedThumbImage)
            {
                if (i==self.currentPage)
                {
                    [self.selectedThumbImage drawInRect:CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter)];
                }
                else
                {
                    [self.thumbImage drawInRect:CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter)];
                }
            }
        }
	}
}

- (void)setPageControlStyle:(PageControlStyle)style
{
    _pageControlStyle = style;
    [self setNeedsDisplay];
}

- (PageControlStyle)pageControlStyle
{
    return _pageControlStyle;
}

- (void)setCurrentPage:(int)page
{
    _currentPage = page;
    [self setNeedsDisplay];
}

- (int)currentPage
{
    return _currentPage;
}

- (void)setNumberOfPages:(int)numOfPages
{
    _numberOfPages = numOfPages;
    [self setNeedsDisplay];
}

- (int)numberOfPages
{
    return _numberOfPages;
}


@end
