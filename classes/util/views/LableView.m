//
//  LableView.m
//  flashapp
//
//  Created by 李 电森 on 11-12-16.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "LableView.h"

@implementation LableView

@synthesize text;
@synthesize font;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [[UIImage imageNamed:@"grayBar.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:14];
        [self addSubview:imageView];
        [imageView release];
        
        label = [[UILabel alloc] initWithFrame:frame];
        label.textAlignment = UITextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        [self addSubview:label];
    }
    return self;
}


- (void) dealloc
{
    [text release];
    [label release];
    [super dealloc];
}


- (void) setText:(NSString *)t
{
    if ( text ) [text release];
    text = [t retain];
    label.text = t;
}


- (void) setFont:(UIFont *)f
{
    label.font = f;
}


- (void) setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    [label setBackgroundColor:backgroundColor];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
