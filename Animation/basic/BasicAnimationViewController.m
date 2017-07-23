//
//  BasicAnimationViewController.m
//  Animation
//
//  Created by chun on 2017/7/23.
//  Copyright © 2017年 chun. All rights reserved.
//

#import "BasicAnimationViewController.h"

#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.height)

@interface BasicAnimationViewController () <UITableViewDataSource, UITableViewDelegate>
{


    NSMutableArray *dataSource;
}

@property (nonatomic, strong)UIImageView *demoView;
@end

@implementation BasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
 
    /*------    动画属性  -------*/
//    Autoreverses            动画结束时是否执行逆动画，通俗的说就是回放- -
//    Duration                动画执行的时间
//    RemovedOnCompletion     动画执行完毕后，图层会保持显示动画执行后的状态，图层动画属性被移除，图层的属性值还是动画执行前的初始值，并没有真正被改变。
//    FillMode                这个属性一般和 RemovedOnCompletion 配合使用，保持动画状态。其中kCAFillModeForwards 当动画结束后,layer会一直保持着动画最后的状态.此时将RemovedOnCompletion设为NO
//    Speed                   动画执行速度
//    RepeatCount             动画重复次数
//    RepeatDuration          动画重复执行的时间段
//    FromValue               动画执行的初始值
//    ToValue                 动画执行的效果值
//    ByValue                 所改变属性相同起始值的改变量
//    TimingFunction          控制动画的显示节奏系统提供五种值选择，分别是： 1.kCAMediaTimingFunctionLinear                  线性动画
//            2.kCAMediaTimingFunctionEaseIn        先慢后快
//            3.kCAMediaTimingFunctionEaseOut       先快后慢
//            4.kCAMediaTimingFunctionEaseInEaseOut 先慢后快再慢
//            5.kCAMediaTimingFunctionDefault       默认，也属于中间比较快
//    BeginTime	可以用来设置动画延迟执行时间，若想延迟1s，就设置为CACurrentMediaTime()+1，CACurrentMediaTime()为图层的当前时间
    
    
/*------    动画keypath  -------*/
//    transform.scale      比例转换	@(0.8)
//    transform.scale.x	宽的比例	@(0.8)
//    transform.scale.y	高的比例	@(0.8)
//    transform.rotation.x	围绕x轴旋转	@(M_PI)
//    transform.rotation.y	围绕y轴旋转	@(M_PI)
//    transform.rotation.z	围绕z轴旋转	@(M_PI)
//    cornerRadius            圆角的设置	@(50)
//    backgroundColor         背景颜色的变化	(id)[UIColor purpleColor].CGColor
//    bounds                  大小，中心不变	[NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
//    position                位置(中心点的改变)	[NSValue valueWithCGPoint:CGPointMake(300, 300)];
//    contents                内容，比如UIImageView的图片	imageAnima.toValue = (id)[UIImage imageNamed:@”to”].CGImage;
//    opacity                 透明度	@(0.7)
//    contentsRect.size.width
//
//    margin
//    
//    zPosition

//    borderWidth
//
//    contentsRect
//    
//    frame
//    
//    hidden
//    
//    mask
//    
//    masksToBounds
//
//    shadowColor
//    
//    shadowOffset
//    
//    shadowOpacity
//    
//    shadowRadius
    
    //位移、透明度、缩放、旋转、背景
    dataSource = [NSMutableArray array];
    [dataSource addObject:@"transform.scale(缩放)"];
    [dataSource addObject:@"transform.scale.x(缩放)"];
    [dataSource addObject:@"transform.scale.y(缩放)"];
    
    [dataSource addObject:@"transform.rotation.x(旋转)"];
    [dataSource addObject:@"transform.rotation.y(旋转)"];
    [dataSource addObject:@"transform.rotation.z(旋转)"];
    
    [dataSource addObject:@"cornerRadius（圆角@（50））"];
    [dataSource addObject:@"backgroundColor(背景色)"];
    [dataSource addObject:@"bounds(大小改变，中心不变)"];

    [dataSource addObject:@"position"];
    [dataSource addObject:@"opacity"];
    [dataSource addObject:@"hidden"];
    
    [dataSource addObject:@"contents"];
    [dataSource addObject:@"contentsRect.size.width"];
    [dataSource addObject:@"margin"];//未实现
    
    [dataSource addObject:@"zPosition"];
    [dataSource addObject:@"borderWidth"];
    [dataSource addObject:@"contentsRect"];
    
    [dataSource addObject:@"frame"];
    [dataSource addObject:@"mask"];
    [dataSource addObject:@"masksToBounds"];

    [dataSource addObject:@"shadowColor"];
    [dataSource addObject:@"shadowOffset"];
    [dataSource addObject:@"shadowOpacity"];

    [dataSource addObject:@"shadowRadius"];
    

    
    UITableView *animationTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    animationTable.delegate = self;
    animationTable.dataSource = self;

    [self.view addSubview:animationTable];
    
    [self.view addSubview:self.demoView];

    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(280, 400, 40, 40)];
    [testView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:testView];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    [cell.textLabel setText:dataSource[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0) {
        [self transformScale:@"transform.scale"];
    }
    
    if (indexPath.row == 1) {
        [self transformScaleX:@"transform.scale.x"];
    }
    
    if (indexPath.row == 2) {
        [self transformScaleY:@"transform.scale.y"];
    }
    
    if (indexPath.row == 3) {
        [self transformRotationX:@"transform.rotation.x"];
    }
    
    if (indexPath.row == 4) {
        [self transformRotationY:@"transform.rotation.y"];
    }

    if (indexPath.row == 5) {
        [self transformRotationZ:@"transform.rotation.z"];
    }

    if (indexPath.row == 6) {
        [self cornerRadius:@"cornerRadius"];
    }
    
    if (indexPath.row == 7) {
        [self backgroundColor:@"backgroundColor"];
    }

    if (indexPath.row == 8) {
        [self bounds:@"bounds"];
    }
    
    if (indexPath.row == 9) {
        [self positionAnimation:@"position"];
    }
    
    if (indexPath.row == 10) {
        [self opacity:@"opacity"];
    }
    
    if (indexPath.row == 11) {
        [self hidden:@"hidden"];
    }
    
    if (indexPath.row == 12) {
        [self contents:@"contents"];
    }

    if (indexPath.row == 13) {
        [self contentsRectSizeWidth:@"contentsRect.size.width"];
    }

    if (indexPath.row == 14) {
        [self margin:@"margin"];// no implement
    }

    
    if (indexPath.row == 15) {
        [self zPosition:@"zPosition"];// no implement
    }

    if (indexPath.row == 16) {
        [self borderWidth:@"borderWidth"];
    }

    if (indexPath.row == 17) {
        [self contentsRect:@"contentsRect"];
    }

    
    if (indexPath.row == 18) {
        [self frame:@"frame"];
    }

    if (indexPath.row == 19) {
        [self mask:@"mask"];// no implement
    }

    if (indexPath.row == 20) {
        [self masksToBounds:@"masksToBounds"];// no implement
    }

    
    if (indexPath.row == 21) {
        [self shadowColor:@"shadowColor"];
    }

    if (indexPath.row == 22) {
        [self shadowOffset:@"shadowOffset"];
    }

    if (indexPath.row == 23) {
        [self shadowOpacity:@"shadowOpacity"];
    }

    
    if (indexPath.row == 24) {
        [self shadowRadius:@"shadowRadius"];
    }


    
}

- (UIImageView *)demoView
{
    if (!_demoView) {
        _demoView = [[UIImageView alloc] initWithFrame:CGRectMake(0,64, 100, 100)];
        [_demoView setImage:[UIImage imageNamed:@"green"]];
    }
    
    return _demoView;
}

- (void)transformScale:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:path];
    
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.1];
    animation.duration = 2.0;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/

    
    [_demoView.layer addAnimation:animation forKey:@"transform.scale"];
}

- (void)transformScaleX:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:path];
    
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.5f];
    animation.duration = 2.0;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    
    [_demoView.layer addAnimation:animation forKey:@"transform.scale.x"];
}

- (void)transformScaleY:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:path];
    
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:3.0f];
    animation.duration = 2.0;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    
    [_demoView.layer addAnimation:animation forKey:@"transform.scale.y"];
}

//transform.rotation.x
- (void)transformRotationX:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:path];
    
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.duration = 2.0;
    animation.toValue = [NSNumber numberWithFloat:M_PI * -2.0f];
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    
    [_demoView.layer addAnimation:animation forKey:@"transform.rotation.x"];
}

- (void)transformRotationY:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:path];
    
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.duration = 2.0;
    animation.toValue = [NSNumber numberWithFloat:M_PI * 2.0f];
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    
    [_demoView.layer addAnimation:animation forKey:@"transform.rotation.y"];
}

- (void)transformRotationZ:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:path];
    
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.duration = 1.0;
    animation.toValue = [NSNumber numberWithFloat:M_PI * 2.0f];
    animation.cumulative = YES;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    
    [_demoView.layer addAnimation:animation forKey:@"transform.rotation.z"];
}



- (void)cornerRadius:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:path];
    
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:10.0f];
    animation.duration = 2.0;
//    animation.autoreverses = YES;//动画结束后会按动画的方式返回到之前的效果
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    
    [_demoView.layer addAnimation:animation forKey:@"cornerRadius"];
}

- (void)backgroundColor:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:path];
    
    animation.fromValue = (id)[UIColor redColor].CGColor;
    animation.duration = 2.0;
    animation.toValue = (id)[UIColor grayColor].CGColor;
        animation.autoreverses = YES;//动画结束后会按动画的方式返回到之前的效果
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    
    [_demoView.layer addAnimation:animation forKey:@"backgroundColor"];
}

- (void)bounds:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:path];
    
    animation.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 64, 40, 40)];
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];

    animation.duration = 2.0;
    animation.autoreverses = YES;//动画结束后会按动画的方式返回到之前的效果
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    
    [_demoView.layer addAnimation:animation forKey:@"bounds"];
}



- (void)autoreversesTransformScale:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:path];
    
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.1];
    animation.duration = 2.0;
    animation.autoreverses = YES;//动画结束后会按动画的方式返回到之前的效果
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    
    [_demoView.layer addAnimation:animation forKey:@"transform.scale"];
}



- (void)positionAnimation:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.demoView.frame.origin.x, self.demoView.frame.origin.y)];
    
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 420)];
    
    anima.duration = 1.0f;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
//    anima.fillMode = kCAFillModeForwards;
//    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"position"];

}


//opacity
- (void)opacity:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    
    anima.fromValue = [NSNumber numberWithFloat:1];
    
    anima.toValue = [NSNumber numberWithFloat:0];
    
    anima.duration = 1.0f;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"position"];
    
}

//hidden
- (void)hidden:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    
    anima.fromValue = [NSNumber numberWithBool:NO];
    
    anima.toValue = [NSNumber numberWithBool:YES];
    
    anima.duration = 1.0f;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"position"];
    
}


- (void)contents:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    
//    anima.fromValue = [NSNumber numberWithBool:NO];
//   可以不指定fromValue
    anima.toValue = (id)[UIImage imageNamed:@"flower"].CGImage;
    
    anima.duration = 1.0f;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"contents"];
    
}

- (void)contentsRectSizeWidth:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    
//    anima.fromValue = [NSNumber numberWithFloat:0];
    
    anima.toValue = [NSNumber numberWithFloat:0.7f];
    
    anima.duration = 2.0f;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"contentsRect.size.width"];
    
}

- (void)margin:(NSString *)path
{
    if (!path) {
        return;
    }
    
//    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
//    
//    UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, -10, -10);
//    
////    anima.fromValue = [NSValue valueWithUIEdgeInsets:insets];
//    
//    anima.toValue = [NSValue valueWithUIEdgeInsets:insets];;
//    
//    anima.duration = 2.0f;
//    
//    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
//    //    anima.fillMode = kCAFillModeForwards;
//    //    anima.removedOnCompletion = NO;
//    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
//    
//    [_demoView.layer addAnimation:anima forKey:@"margin"];
//    
}


- (void)zPosition:(NSString *)path
{
//    if (!path) {
//        return;
//    }
//    
//    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
//    
//    
//    anima.fromValue = [NSNumber numberWithBool:NO];
//    
//    anima.toValue = [NSNumber numberWithBool:YES];
//    
//    anima.duration = 1.0f;
//    
//    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
//    //    anima.fillMode = kCAFillModeForwards;
//    //    anima.removedOnCompletion = NO;
//    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
//    
//    [_demoView.layer addAnimation:anima forKey:@"position"];
    
}

- (void)borderWidth:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    
    anima.fromValue = [NSNumber numberWithFloat:0];
    
    anima.toValue = [NSNumber numberWithFloat:5.0f];
    
    anima.duration = 1.0f;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"borderWidth"];
    
}

- (void)contentsRect:(NSString *)path
{
    if (!path) {
        return;
    }
    
    path = @"contentsRect.origin.x";
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    
//    contentsRect.origin.y
    
    anima.fromValue = [NSNumber numberWithFloat:0];

    anima.toValue = [NSNumber numberWithFloat:0.1f];

//    anima.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
//    
//    anima.toValue = [NSValue valueWithCGRect:CGRectMake(20, 20, 40, 40)];
    
    anima.duration = 1.0f;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"contentsRect"];
    
}


- (void)frame:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    
//    anima.fromValue = [NSValue valueWithCGRect:CGRectMake(10, 10, 200, 200)];
    
    anima.toValue = [NSValue valueWithCGRect:CGRectMake(10, 10, 200, 200)];
    
    anima.duration = 1.0f;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"frame"];
    
}

- (void)mask:(NSString *)path
{
//    if (!path) {
//        return;
//    }
//    
//
//    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
//    
//    
//    anima.fromValue = [NSNumber numberWithBool:NO];
//    anima.toValue = [NSNumber numberWithBool:YES];
//    
//    anima.duration = 1.0f;
//    
//    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
//    //    anima.fillMode = kCAFillModeForwards;
//    //    anima.removedOnCompletion = NO;
//    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
//    
//    [_demoView.layer addAnimation:anima forKey:@"position"];
    
}

- (void)masksToBounds:(NSString *)path
{
//    if (!path) {
//        return;
//    }
//    
//    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
//    
//    
//    anima.fromValue = [NSNumber numberWithBool:NO];
//    
//    anima.toValue = [NSNumber numberWithBool:YES];
//    
//    anima.duration = 1.0f;
//    
//    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
//    //    anima.fillMode = kCAFillModeForwards;
//    //    anima.removedOnCompletion = NO;
//    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
//    
//    [_demoView.layer addAnimation:anima forKey:@"position"];
    
}


- (void)shadowColor:(NSString *)path
{
    if (!path) {
        return;
    }
    

    [_demoView.layer setShadowColor:[UIColor grayColor].CGColor];
    [_demoView.layer setShadowOffset:CGSizeMake(2,2)];
    [_demoView.layer setShadowOpacity:1];
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    anima.toValue = (id)[UIColor redColor].CGColor;
    anima.fromValue =  (id)[UIColor blackColor].CGColor;
    
    anima.duration = 1.0f;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//

    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"shadowColor"];
    
}

- (void)shadowOffset:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    anima.fromValue = [NSValue valueWithCGSize:CGSizeMake(0,0)];
    anima.toValue = [NSValue valueWithCGSize:CGSizeMake(3,3)];
    
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//控制动画的显示节奏系统提供五种值选择，分别是
    
    anima.duration = 2.0f;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"shadowOffset"];
    
}

- (void)shadowOpacity:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    
    anima.fromValue = [NSNumber numberWithFloat:1.0f];
    
    anima.toValue = [NSNumber numberWithFloat:0.4f];
    
    anima.duration = 1.0f;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"shadowOpacity"];
    
}


- (void)shadowRadius:(NSString *)path
{
    if (!path) {
        return;
    }
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:path];
    
    
    anima.fromValue = [NSNumber numberWithFloat:5];
    anima.toValue = [NSNumber numberWithFloat:10];
    
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    anima.duration = 1.0f;
    
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.removedOnCompletion = NO;
    /*  --- 这两句使layer动画结束后不恢复到原样  ----*/
    
    [_demoView.layer addAnimation:anima forKey:@"shadowRadius"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
