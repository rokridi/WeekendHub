//
//  WeekendTableViewCell.m
//  WeekendHub
//
//  Created by Rokridi on 15/07/2017.
//  Copyright © 2017 Rokridi. All rights reserved.
//

#import "WeekendTableViewCell.h"
#import "Weekend.h"
#import <SDWebImage/UIView+WebCache.h>
#import <UIImageView+WebCache.h>

NSString * const WeekendTableViewCellIdentifier = @"WeekendTableViewCell";

@interface WeekendTableViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *weekendImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *themeLabel;

@end

@implementation WeekendTableViewCell

/*
 Returns a string that represents the concatenation of weekend's themes.
 
 @param weekend Weekend for which we want to get themes description.
 
 @return Themes description.
 */
- (NSString *)themeTextForWeekend:(Weekend *)weekend {
    
    NSMutableString *themeText = [[NSMutableString alloc] init];
    
    if (weekend.topTheme.count > 0) {
        
        themeText = @"*".mutableCopy;
        
        for (NSString *theme in weekend.topTheme) {
            
            [themeText appendFormat:@" %@ *", theme];
        }
        
        return themeText.copy;
    }
    
    return themeText;
}

#pragma mark - UITableViewCell

- (void)prepareForReuse {

    [super prepareForReuse];
    
    [self.weekendImageView sd_cancelCurrentImageLoad];
}

#pragma mark - Custom setters

- (void)setWeekend:(Weekend *)weekend {
    
    //Fill UI with appropriate information.
    self.titleLabel.text = weekend.label;
    self.themeLabel.text = [self themeTextForWeekend:weekend];
    
    NSURL *imageURL = [NSURL URLWithString:weekend.imageUrl];
    
    //Load the image from Weekend's given imageURL.
    [self.weekendImageView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"place_holder"]];
}

@end
