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
    
    //Request URL definition
    NSURL * url= [NSURL URLWithString:@"https://qastusoft.com.es/apis/futurama_quotes.php"];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    //Request type
    request.HTTPMethod = @"GET";
    //Request Body
    //request.HTTPBody =[[[NSString alloc]initWithFormat:@"?name=test"] dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data,NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        if(error==nil){
            NSHTTPURLResponse * res=(NSHTTPURLResponse *) response;
            if([res statusCode]==200){
                NSLog(@"HTTP Request Success");
                self->characterList = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]; //Information received
            }else{
                NSLog(@"HTTP Request Failed with status code %li", (long)[res statusCode]);
            }
        }else{
            NSLog(@"Error connecting to server");
        }
    }];
    [task resume];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [characterList count];
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell * cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *character = [characterList objectAtIndex:indexPath.row];
    NSData * imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:[character objectForKey:@"image"]]];
    [cell.imagen setImage:[[UIImage alloc]initWithData:imageData]];
    cell.etiqueta.text = [character objectForKey:@"character"];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (CGRectGetWidth(_collectionView.frame)/2)-10;
    CGFloat height = width;
    return CGSizeMake(width, height);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dict= [characterList objectAtIndex:indexPath.row];
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:[dict objectForKey:@"character"] message:[dict objectForKey:@"quote"] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * close= [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:close];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
