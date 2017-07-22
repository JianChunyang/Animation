//
//  ViewController.m
//  Animation
//
//  Created by chun on 2017/7/20.
//  Copyright © 2017年 chun. All rights reserved.
//

#import "ViewController.h"
#import "ParabolaLine.h"

@interface ViewController ()

{
    UIView *fristView;
    UIView *secodeView;
    
    ParabolaLine *parabola;
}
@property (nonatomic, strong) UIView *throwView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self throwView];
    
    [self.view addSubview:self.throwView];
    
    fristView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self.view addSubview:fristView];
    [fristView setBackgroundColor:[UIColor redColor]];
    
    
    secodeView = [[UIView alloc] initWithFrame:CGRectMake(300, 600, 40, 40)];
    [self.view addSubview:secodeView];
    [secodeView setBackgroundColor:[UIColor grayColor]];

    
    ParabolaLine *line = [ParabolaLine sharedInstence];
    line.animationCompletion = ^{
        NSLog(@"1");
        if (_throwView) {
            [_throwView removeFromSuperview];
            _throwView = nil;
        }
    };
    parabola = line;
    
    
    
    
//    [self label]; // 添加自定义字体
    
}

- (void)label
{
    NSArray * fontArrays = [[UIFont familyNames] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *str1 = (NSString *)obj1;
        NSString *str2 = (NSString *)obj2;
        return [str1 compare:str2];
    }];
    
    for(NSString *fontfamilyname in fontArrays) {
        NSLog(@"family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 80, 200, 44)];
    [self.view addSubview:label];
    UIFont *helveticaBold =
    [UIFont fontWithName:@"AcademyEngravedLetPlain" size:40.0f];
    [label setFont:helveticaBold];

    [label setText:@"I Learn Really Fast"];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    CGRect parentRectA = fristView.frame;
    CGRect parentRectB = [self.view convertRect:secodeView .frame
                                         toView:self.view];
    /**
     *  是否执行添加的动画
     */
    self.throwView.frame = fristView.frame;
    [_throwView setBackgroundColor:fristView.backgroundColor];
    [self.view addSubview:_throwView];
    
    UIBezierPath *path= [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(parentRectA.origin.x, parentRectA.origin.y)];
    [path addLineToPoint:parentRectB.origin];
    
    [parabola throwView:_throwView path:path rotaion:YES endScale:0.1f];
}

- (UIView *)throwView
{
    if (!_throwView) {
        _throwView = [[UIView alloc] init];
    }
    
    return _throwView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
