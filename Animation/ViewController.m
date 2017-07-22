//
//  ViewController.m
//  Animation
//
//  Created by chun on 2017/7/20.
//  Copyright © 2017年 chun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self label];
}

- (void)label
{
    NSArray * fontArrays = [[UIFont familyNames] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *str1 = (NSString *)obj1;
        NSString *str2 = (NSString *)obj2;
        return [str1 compare:str2];
    }];
    
    for(NSString *fontfamilyname in fontArrays)
    {
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
