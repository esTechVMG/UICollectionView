//
//  ViewController.m
//  UICollectionView
//
//  Created by A4-iMAC01 on 03/11/2020.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell * cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.etiqueta.text = [[NSString alloc] initWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}
//for size at index path
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (CGRectGetWidth(_collectionView.frame)/2)-10;
    CGFloat height = width;
    return CGSizeMake(width, height);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Test" message:[[NSString alloc]initWithFormat:@"Number:%ld",indexPath.row] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok= [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
