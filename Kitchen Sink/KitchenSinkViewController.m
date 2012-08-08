//
//  KitchenSinkViewController.m
//  Kitchen Sink
//
//  Created by Martin Mandl on 08.08.12.
//  Copyright (c) 2012 m2m. All rights reserved.
//

#import "KitchenSinkViewController.h"
#import "AskerViewController.h"

@interface KitchenSinkViewController () <AskerViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *kitchenSink;

@end

@implementation KitchenSinkViewController

@synthesize kitchenSink = _kitchenSink;

- (IBAction)tap:(UITapGestureRecognizer *)gesture 
{
    CGPoint tapLocation = [gesture locationInView:self.kitchenSink];
    
    for (UIView *view in self.kitchenSink.subviews) {
        if (CGRectContainsPoint(view.frame, tapLocation)) {
            [UIView animateWithDuration:4.0 animations:^{
                [self setRandomLocationForView:view];
            }];
        }
    }
}

- (void)setRandomLocationForView:(UIView *)view
{
    [view sizeToFit];
    CGRect sinkBounds = CGRectInset(self.kitchenSink.bounds, 
                                    view.frame.size.width / 2, 
                                    view.frame.size.height / 2);
    CGFloat x = arc4random() % (int)sinkBounds.size.width + view.frame.size.width / 2;
    CGFloat y = arc4random() % (int)sinkBounds.size.height + view.frame.size.height / 2;
    view.center = CGPointMake(x, y);    
}

- (void)addLabel:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:48.0];
    label.backgroundColor = [UIColor clearColor];
    [self setRandomLocationForView:label];
    [self.kitchenSink addSubview:label];
}

- (void)askerViewController:(AskerViewController *)sender 
             didAskQuestion:(NSString *)question 
               andGotAnswer:(NSString *)answer
{
    [self addLabel:answer];
    [self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier hasPrefix:@"Create Label"]) {
        AskerViewController *asker = (AskerViewController *)segue.destinationViewController;
        asker.answer = @"Label Text";
        asker.question = @"What do you want your label to say?";
        asker.delegate = self;        
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
