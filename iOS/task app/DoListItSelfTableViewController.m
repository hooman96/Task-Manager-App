//
//  DoListItSelfTableViewController.m
//  singlie page app
//
//  Created by hooman mohammadi on 7/15/15.
//  Copyright (c) 2015 hooman mohammadi. All rights reserved.
//

#import "DoListItSelfTableViewController.h"
#import "DoListObject.h"
#import "AddItemtoStuffController.h"


@interface DoListItSelfTableViewController ()

@property NSMutableArray *toDoSutff;

@end

@implementation DoListItSelfTableViewController

- (void) loadInitialData {
  DoListObject *item1 = [[DoListObject alloc] init];
  item1.workName = @"finish my work";
  [self.toDoSutff addObject:item1];
  DoListObject *obj2 = [[DoListObject alloc] init];
  obj2.workName = @"second thing";
  [self.toDoSutff addObject:obj2];
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.toDoSutff = [[NSMutableArray alloc] init];
  //array initilization and call with alloc
  
  [self loadInitialData];
  
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.toDoSutff count];
}

- (IBAction)unwindToDoList:(UIStoryboardSegue *)segue {
  AddItemtoStuffController *source = [segue sourceViewController];
  DoListObject *item = source.doListItem;
  
  if (item != nil) {
    [self.toDoSutff addObject:item];
    [self.tableView reloadData];
  }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
  
  DoListObject *doListItem = [self.toDoSutff objectAtIndex:indexPath.row];
  
  cell.textLabel.text = doListItem.workName;
  
  if (doListItem.complete) {
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
  }
  else {
    cell.accessoryType = UITableViewCellAccessoryNone;
  }
  
  return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:NO];
  DoListObject *tappedItem = [self.toDoSutff objectAtIndexedSubscript:indexPath.row];
  
  tappedItem.complete = !tappedItem.complete;
  
  [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
