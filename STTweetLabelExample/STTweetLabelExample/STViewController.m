//
//  STViewController.m
//  STTweetLabel
//
//  Created by Sebastien Thiebaud on 12/15/12.
//  Copyright (c) 2012 Sebastien Thiebaud. All rights reserved.
//

#import "STViewController.h"
#import "STTweetLabel.h"

@interface STViewController ()

@end

@implementation STViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    NSString *labelString1 = @"【哥伦比亚举办“喵星人PK大赛”】2013年2月16日，哥伦比亚麦德林，国际猫展举行，共有大约18个品种的猫咪参加了此次展览。来看看有没有萌到你的喵星人吧！http://t.cn/zYSi4pa （让< Your smile>伴您入眠）音乐来自@爱奇艺 http://t.cn/zWUhNCb";
    NSString *labelString2= @"Hi. This is a new tool for This is a new tool for This is a new tool for @you! Developed by -> @SebThiebaud for #iPhone #Obj-C... ;-) My GitHub page: https://www.github.com/SebastienThiebaud! @干嘛哈哈哈哈哈哈哈哈";
    
    
//    _tweetLabel = [[STTweetLabel alloc] initWithFrame:CGRectMake(20.0, 60.0, 280.0, 230.0)];
//    [_tweetLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:17.0]];
//    [_tweetLabel setTextColor:[UIColor blackColor]];
//    [_tweetLabel setText:labelString1];
    
    [_normalLabel setNumberOfLines:0] ;
    [_normalLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [_normalLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:17.0]];
    CGSize rect = [labelString1 sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:17.0] constrainedToSize:CGSizeMake(280, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    CGRect normalRect = _normalLabel.frame;
    normalRect.size.height = rect.height;
    _normalLabel.frame = normalRect;
    [_normalLabel setText:labelString1];
    

    STLinkCallbackBlock callbackBlock = ^(STLinkActionType actionType, NSString *link) {
        
        NSString *displayString = NULL;
        
        switch (actionType) {
                
            case STLinkActionTypeAccount:
                displayString = [NSString stringWithFormat:@"Twitter account:\n%@", link];
                break;
                
            case STLinkActionTypeHashtag:
                displayString = [NSString stringWithFormat:@"Twitter hashtag:\n%@", link];
                break;
                
            case STLinkActionTypeWebsite:
                displayString = [NSString stringWithFormat:@"Website:\n%@", link];
                break;
        }
        
        [_displayLabel setText:displayString];
        
    };
    
    [_tweetLabel setCallbackBlock:callbackBlock];
    
    [self.view addSubview:_tweetLabel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
