//
//  MyCollectionViewCell.h
//  LOLHeroShow
//
//  Created by tarena on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"
@interface MyCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftIV;
@property (weak, nonatomic) IBOutlet UIImageView *myIV;
@property (weak, nonatomic) IBOutlet UITextView *connectTV;

@property(nonatomic,strong)Video *v;
@end
