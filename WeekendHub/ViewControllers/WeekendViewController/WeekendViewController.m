//
//  WeekendViewController.m
//  WeekendHub
//
//  Created by Rokridi on 16/07/2017.
//  Copyright © 2017 Rokridi. All rights reserved.
//

#import "WeekendViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Weekend.h"

@interface WeekendViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation WeekendViewController

- (void)showProgramDescription {
    
    NSMutableString *programDescription = [[NSMutableString alloc] init];
    
    for (NSString * programStep in self.weekend.programIntro) {
        
        [programDescription appendFormat:@"%@\n", programStep];
    }
    
    self.textView.text = programDescription;
}

#pragma mark - UIViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.titleLabel.text = self.weekend.label;
    self.priceLabel.text = [NSString stringWithFormat:@"%lu €", (unsigned long)self.weekend.sellPrice];
    self.discountLabel.text = [NSString stringWithFormat:@"(-%lu %%)", (unsigned long)self.weekend.promoPercentageRounded];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.weekend.imageUrl] placeholderImage:[UIImage imageNamed:@"place_holder"]];
    
    [self showProgramDescription];
}

@end
