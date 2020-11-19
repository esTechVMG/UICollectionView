//
//  Character.h
//  UICollectionView
//
//  Created by A4-iMAC01 on 18/11/2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Character : NSObject
@property (readwrite,nonatomic) NSString *name;
@property (readwrite,nonatomic) NSString *quote;
@property (readwrite,nonatomic) NSData *image;
-(id)initWithName:(NSString *)name quote:(NSString *)quote andImage:(NSData *)image;
@end
NS_ASSUME_NONNULL_END
