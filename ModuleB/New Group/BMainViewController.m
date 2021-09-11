//
//  BMainViewController.m
//  ModuleB
//
//  Created by ffzp on 2021/9/11.
//

#import "BMainViewController.h"
#import "DictSearchRequest.h"
@interface BMainViewController ()
@property (nonatomic,strong)UITextField *textField;
@property (nonatomic,strong)UIButton *searchButton;
@property (nonatomic,strong)UITextView *textView;
@end

@implementation BMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self buildSubViews];
    
}

-(void)buildSubViews{
    CGFloat srceenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat buttonWidth = 60;
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 88, srceenWidth - 60 - buttonWidth, 50)];
    _textField.borderStyle = UITextBorderStyleBezel;
    
    _searchButton = [[UIButton alloc] initWithFrame:CGRectMake(_textField.frame.size.width + _textField.frame.origin.x + 20, 88, buttonWidth, 50)];
    [_searchButton addTarget:self action:@selector(startSearchRequest:) forControlEvents:UIControlEventTouchUpInside];
    [_searchButton setTitle:@"search" forState:UIControlStateNormal];
    [_searchButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 88 + 50 + 20, srceenWidth - 40, 300)];
    _textView.editable = NO;
    
    [self.view addSubview:_textField];
    [self.view addSubview:_searchButton];
    [self.view addSubview:_textView];
}

-(void)startSearchRequest:(UIButton *)sender{
    sender.userInteractionEnabled = NO;
    
    DictSearchRequest *req = [[DictSearchRequest alloc] initRequestWithKey:self.textField.text size:5 doctype:@"json"];
    __weak typeof(self)weakSelf = self;
    [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        sender.userInteractionEnabled = YES;
        NSLog(@"%@",request.responseString);
        weakSelf.textView.text = request.responseString;
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        sender.userInteractionEnabled = YES;
    }];
}


@end
