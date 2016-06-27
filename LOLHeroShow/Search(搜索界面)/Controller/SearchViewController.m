//
//  SearchViewController.m
//  LOLHeroShow
//
//  Created by tarena on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "SearchViewController.h"
#import "MyCollectionViewCell.h"
#import "Video.h"
#import "WebViewController.h"
#import "HeroShowHubView.h"
@interface SearchViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSArray *videos;

@end

@implementation SearchViewController
static NSString * const reuseIdentifier = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self addSearch];
    UICollectionViewFlowLayout *fl = [UICollectionViewFlowLayout new];
    
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:fl];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];

}
-(void)addSearch
{
    UIView *v = [[UIView alloc]initWithFrame:self.navigationController.navigationBar.bounds];
    [self.navigationController.navigationBar addSubview:v];
    UIView *v1 = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 275, 25)];
   
    v1.layer.borderWidth = 1;
    v1.layer.borderColor = [UIColor blackColor].CGColor ;
    v1.layer.cornerRadius = 5;
    v1.layer.masksToBounds = YES;
    
    UITextField *searchTF = [[UITextField alloc]initWithFrame:CGRectMake(25, 0, 250, 25)];
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 15, 15)];
    iv.image = [UIImage imageNamed:@"Search (1)"];
    [v1 addSubview:iv];
    [v1 addSubview:searchTF];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(300, 10, 50, 25)];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [btn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"搜索" forState:UIControlStateNormal];
    [v addSubview:btn];
    [v addSubview:v1];
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return CGSizeMake(180, 220);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 0, 5);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    
    
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *vc = [WebViewController new];
    [self  presentViewController:vc animated:YES completion:nil];
     }
-(void)search
{
    NSLog(@"正在搜索中");
    [self presentViewController:[[HeroShowHubView alloc]init] animated:YES completion:nil];
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
