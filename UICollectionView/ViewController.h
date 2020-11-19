//
//  ViewController.h
//  UICollectionView
//
//  Created by A4-iMAC01 on 03/11/2020.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    NSArray * characterList;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

