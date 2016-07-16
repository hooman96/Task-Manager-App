//
//  AddItemtoStuffController.m
//  singlie page app
//
//  Created by hooman mohammadi on 7/15/15.
//  Copyright (c) 2015 hooman mohammadi. All rights reserved.
//

#import "AddItemtoStuffController.h"

@interface AddItemtoStuffController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddItemtoStuffController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if (sender != self.saveButton) {
    return;
  }
  
  if (self.textField.text.length > 0) {
    self.doListItem = [[DoListObject alloc] init];
    self.doListItem.workName = self.textField.text;
    self.doListItem.complete = NO;
    
  }
  
  
}


@end
