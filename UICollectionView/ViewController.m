//
//  ViewController.m
//  UICollectionView
//
//  Created by A4-iMAC01 on 03/11/2020.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "Character.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    Character * e = [[Character alloc]init];
    e.character=@"EH";
    NSLog(e.character);
    
    //Request URL definition
    /*NSURL * url= [NSURL URLWithString:@"https://qastusoft.com.es/apis/login.php"];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    //Request type
    request.HTTPMethod = @"POST";
    //Request Body
    request.HTTPBody =[[[NSString alloc]initWithFormat:@"?name=test"] dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data,NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        if(error==nil){
            NSHTTPURLResponse * res=(NSHTTPURLResponse *) response;
            if([res statusCode]==200){
                NSLog(@"HTTP Request Success");
                NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]; //Information received
                NSLog(dict);
            }else{
                NSLog(@"HTTP Request Failed with status code %li", (long)[res statusCode]);
            }
        }else{
            NSLog(@"Error connecting to server");
        }
                //NSLog(@"COMPLETE RESPONSE: %@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
                //NSLog(@"JSON RESPONSE: %@",serializedResponse);
                //NSLog(@"%@",response);
                //NSLog(@"ERROR: %@",error);
    }];
    [task resume];*/
    
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
