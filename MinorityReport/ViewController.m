//
//  ViewController.m
//  MinorityReport
//
//  Created by Meredith Packham on 5/15/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myFutureLabel;
@property (weak, nonatomic) IBOutlet UILabel *preCogsLabel;
@property CGAffineTransform transform;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.transform = self.myFutureLabel.transform;
}

-(IBAction)onDrag:(UIPanGestureRecognizer *)panGestureRecognizer
{

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1.0 animations:^{
            self.myFutureLabel.transform = self.transform;
        }];
    }
        else {

    CGPoint point;
    point = [panGestureRecognizer translationInView:self.view];
    self.myFutureLabel.transform = CGAffineTransformMakeTranslation(point.x, point.y);
    point.x += self.myFutureLabel.center.x;
    point.y += self.myFutureLabel.center.y;


    if(CGRectContainsPoint(self.preCogsLabel.frame, point))
    {
        self.myFutureLabel.text = @"a ficticious and incriminating future";
        self.myFutureLabel.backgroundColor = [UIColor orangeColor];
        [self.myFutureLabel sizeToFit];
    }
        }
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
