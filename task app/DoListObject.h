//
//  DoListObject.h
//  singlie page app
//
//  Created by hooman mohammadi on 7/16/15.
//  Copyright (c) 2015 hooman mohammadi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoListObject : NSObject

@property NSString *workName;
@property BOOL complete;
@property (readonly) NSDate *dateCreation;

@end
