//
//  CoreDataException.h
//  Pods
//
//  Created by Prabodh Prakash on 21/08/15.
//
//

#import <Foundation/Foundation.h>

@interface CoreDataException : NSException

- (id) initWithReason: (NSString*) reason;

@end
