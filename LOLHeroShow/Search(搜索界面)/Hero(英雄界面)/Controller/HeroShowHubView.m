//
//  HeroShowHubView.m
//  LOLHeroShow
//
//  Created by tarenayj on 16/6/26.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "HeroShowHubView.h"




//表格的cell
#import "MyHeroTableViewCell.h"
#import "AllHeroTableViewCell.h"
#import "WeeklyFreeHeroTableViewCell.h"

@interface HeroShowHubView ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myHero;
@property (weak, nonatomic) IBOutlet UITableView *weeklyHero;
@property (weak, nonatomic) IBOutlet UITableView *allHero;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
//滚动视图 切换按钮 (用于设置 按钮选中状态)
@property (weak, nonatomic) IBOutlet UIButton *myHeroButton;

@property (weak, nonatomic) IBOutlet UIButton *weeklyButton;

@property (weak, nonatomic) IBOutlet UIButton *allHeroButton;

@end

@implementation HeroShowHubView

- (void)viewDidLoad {
    [super viewDidLoad];
    //分别代理 数据源 设置为 类 为何不行
//    myHeroTableView *my=[myHeroTableView new];
//   self.myHero.delegate = my;
//    self.myHero.dataSource = my;
//    
//    weeklyFreeHeroTableView *week = [weeklyFreeHeroTableView new];
//    self.weeklyHero.delegate = week;
//    self.weeklyHero.dataSource = week;
//    
//    AllHeroTableView *all = [AllHeroTableView new];
//   self.allHero.delegate = all;
//    self.allHero.dataSource = all;
    
//    
    
    
    
    //设置滚动view
    self.scrollView.contentSize = CGSizeMake(3*self.view.frame.size.width,0);//内容高度=0 没有垂直滚动  self.view.frame.size.height-100
    
    self.myHero.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    [self.scrollView addSubview:self.myHero];
    
    self.weeklyHero.frame = CGRectMake(414, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
     [self.scrollView addSubview:self.weeklyHero];
    
    
    
    self.allHero.frame = CGRectMake(828, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
     [self.scrollView addSubview:self.allHero];
    //进页面 我的英雄 按钮 是选中的 显示 我的英雄tableview
    self.myHeroButton.selected = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//滚动视图 切换按钮

- (IBAction)myHeroButton:(id)sender {
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    
//  self.myHeroButton.selected = YES;
//   self.weeklyButton.selected = NO;
//    self.allHeroButton.selected = NO;

}

- (IBAction)weeklyHeroButton:(id)sender {
    [self.scrollView setContentOffset:CGPointMake(414, 0) animated:NO];
//    self.myHeroButton.selected = NO;
//    self.weeklyButton.selected = YES;
//    self.allHeroButton.selected = NO;
}

- (IBAction)allHeroButton:(id)sender {
    [self.scrollView setContentOffset:CGPointMake(828, 0) animated:NO];
//    self.myHeroButton.selected = NO;
//    self.weeklyButton.selected = NO;
//    self.allHeroButton.selected = YES;
}

//滚动视图 发生改变的时候(代理方法) 改变按钮的选中状态
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x==0) {
        self.myHeroButton.selected = YES;
        self.weeklyButton.selected = NO;
        self.allHeroButton.selected = NO;

        
    }
    if (scrollView.contentOffset.x==414) {
        self.myHeroButton.selected = NO;
        self.weeklyButton.selected = YES;
        self.allHeroButton.selected = NO;
        
    }
    if (scrollView.contentOffset.x==828) {
        self.myHeroButton.selected = NO;
        self.weeklyButton.selected = NO;
        self.allHeroButton.selected = YES;

        
    }
    
}

//表格数据设置
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"1111");
    return 3;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.myHero isEqual:tableView]) {//我的英雄表设置
        
    
    MyHeroTableViewCell *cell = [MyHeroTableViewCell cellForTableview:tableView];
        cell.HeroName.text = @"光辉女郎";
        cell.HeroNickName.text= @"拉克丝";
        cell.UseTimes.text = @"7";
        cell.WinRate.text = @"%1000";

    
    return cell;
    }else
    if ([self.weeklyHero isEqual:tableView]) {//周免英雄表设置
        
        
        WeeklyFreeHeroTableViewCell *cell = [WeeklyFreeHeroTableViewCell cellForTableview:tableView];
        cell.LeftHeroTypeLabel.text = @"法师";
        cell.LeftNameLabel.text = @"安妮";
        cell.LeftNickNameLabel.text = @"黑暗之女";
        
        cell.RightHeroTypeLabel.text = @"法师";
        cell.RightNameLabel.text = @"安妮";
        cell.RightNickNameLabel.text = @"黑暗之女";
        
        
        return cell;
    }else
        {//所有英雄表设置
        
            WeeklyFreeHeroTableViewCell *cell = [WeeklyFreeHeroTableViewCell cellForTableview:tableView];
            cell.LeftHeroTypeLabel.text = @"法师";
            cell.LeftNameLabel.text = @"安妮";
            cell.LeftNickNameLabel.text = @"黑暗之女";
            
            cell.RightHeroTypeLabel.text = @"法师";
            cell.RightNameLabel.text = @"安妮";
            cell.RightNickNameLabel.text = @"黑暗之女";

        
        
        return cell;
    }

    
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


@end
