//
//  Character.m
//  UICollectionView
//
//  Created by A4-iMAC01 on 18/11/2020.
//

#import "Character.h"

@implementation Character
- (id)initWithName:(NSString *)name quote:(NSString *)quote andImage:(NSData *)image{
    self.name=name;
    self.quote=quote;
    self.image=image;
    return self;
}
@end
