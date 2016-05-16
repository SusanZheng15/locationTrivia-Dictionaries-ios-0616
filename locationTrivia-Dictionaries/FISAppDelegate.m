//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    return YES;
}

- (NSString *) stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length
{
    NSMutableString *stringByTruncatingNameOfLocation;
    
       if (length >= [location[@"name"] length])
       {
            stringByTruncatingNameOfLocation = location[@"name"];
       }
        else
        {
            stringByTruncatingNameOfLocation = [location[@"name"] substringToIndex:(length)];
        }
    
       NSLog(@"%@", stringByTruncatingNameOfLocation);
       return stringByTruncatingNameOfLocation;

}

- (NSDictionary *) dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
    NSDictionary *dictionaryForLocationWithName = @{
                                                    @"name" : name ,
                                                    @"latitude" : @(latitude) ,
                                                    @"longitude" : @(longitude)
                                                  };
    return dictionaryForLocationWithName;
}

- (NSArray *) namesOfLocations:(NSArray *)locations
{
    NSPredicate *name = [NSPredicate predicateWithFormat: @"%@ IN locations", @"name"];
    NSArray *namesOflocation = [locations valueForKey:@"name"];
    
    return namesOflocation;

}

- (BOOL) dictionaryIsValidLocation:(NSDictionary *)location
{
    BOOL dictionaryIsValidLocation;
    
    if  ([[location allKeys] isEqualToArray:@[@"name", @"longitude", @"latitude",]])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    return dictionaryIsValidLocation;
}

- (NSDictionary *) locationNamed:(NSString *)name inLocations:(NSArray *)locations
{
    NSMutableDictionary *locationNamed = [NSMutableDictionary dictionary];
    NSPredicate *match = [NSPredicate predicateWithFormat:@"self CONTAINS %@", name];
    NSArray *location = [locations filteredArrayUsingPredicate: match];
        
     if ([ location count ] > 0)
     {
         return location[0];
     }
     else
     {
         return nil;
     }
    
    return locationNamed;
}
@end
