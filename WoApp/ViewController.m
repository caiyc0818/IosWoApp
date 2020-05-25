//
//  ViewController.m
//  WoApp
//
//  Created by haodu on 2020/5/25.
//  Copyright © 2020年 haodu. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (strong,nonatomic) UILabel *lable;
@property (strong,nonatomic) UILabel *lable2;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self._lable];
    self._lable.text=@"11111";
    self._lable.textColor=UIColor.redColor;
    self._lable.backgroundColor=UIColor.blueColor;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(self.view.bounds.size.width/2-50,self.view.bounds.size.height-100, 100, 100);
    button.backgroundColor=UIColor.greenColor;
    button.tag = 100 + 0;
//设置buttom点击事件
    [ button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];


    [self.view addSubview:self._lable2];
    self._lable2.text=@"11111";
    self._lable2.textColor=UIColor.blueColor;
    self._lable2.backgroundColor=UIColor.redColor;
    //设置点击事件
    self._lable2.userInteractionEnabled=YES;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
    [self._lable2 addGestureRecognizer:labelTapGestureRecognizer];
         [self.view addSubview:button];

}


-(void) labelTouchUpInside:(UITapGestureRecognizer *)recognizer{
    
    UILabel *label=(UILabel*)recognizer.view;
    
    NSLog(@"%@被点击了",label.text);
//    [self use3:label.text];
    [self use2];
}
- (void)click
{
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"ssss");
    //此处根据不同的tag值，作出不同的点击事件
}

- (UILabel*) _lable {
    if(!_lable){
        _lable =[UILabel new];
        _lable.frame=CGRectMake(0,0, self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    }
    return _lable;
}
- (UILabel*) _lable2 {
    if(!_lable2){
        _lable2 =[UILabel new];
        _lable2.frame=CGRectMake(self.view.bounds.size.width/2, 0, self.view.bounds.size.width/2, self.view.bounds.size.height);
    }
    return _lable2;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}


-(void)event:(UITapGestureRecognizer *)gesture
 {
         //处理事件
     NSLog(@"123er");
     }



#pragma mark 方法3

/**
 
 *  用在IOS8，没有用到代理。跟方式2唯一不同的是:弹框的样式变为“UIAlertControllerStyleActionSheet”, 弹框出现在屏幕底部
 
 */

- (void)use3:(NSString *)string

{
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:string preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        NSLog(@"点击了取消");
        
    }];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        NSLog(@"点击了确定按钮");
    
    
    }];
    
    [alertVc addAction:cancle];
    
    [alertVc addAction:confirm];
    
    
    
    [self presentViewController:alertVc animated:YES completion:^{
        
        nil;
        
    }];
    
}


#pragma mark 方法2

/**
 
 *  用在IOS8，没有代理。点击按钮时要执行的操作放在了block中，因此不需要设置代理
 
 */

- (void)use2

{
    
    // 1.创建弹框控制器, UIAlertControllerStyleAlert这个样式代表弹框显示在屏幕中央
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了头像" preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    // 2.添加取消按钮，block中存放点击了“取消”按钮要执行的操作
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        NSLog(@"点击了取消按钮");
        
    }];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        NSLog(@"点击了确定按钮");
        
    }];
    
    // 3.将“取消”和“确定”按钮加入到弹框控制器中
    
    [alertVc addAction:cancle];
    
    [alertVc addAction:confirm];
    
    
    
    // 4.控制器 展示弹框控件，完成时不做操作
    
    [self presentViewController:alertVc animated:YES completion:^{
        
        nil;
        
    }];
    
}

@end


