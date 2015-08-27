//
//  CoreDataException.m
//  Pods
//
//  Created by Prabodh Prakash on 21/08/15.
//
//

#import "CoreDataException.h"

@implementation CoreDataException

- (instancetype) initWithReason: (NSString*) reason
{
    self = [super initWithName:@"CoreDataDatabaseNotInitializedException" reason:reason userInfo:nil];
    return self;
}

@end
