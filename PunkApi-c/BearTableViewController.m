//
//  BearTableViewController.m
//  PunkApi-c
//
//  Created by Marco Antonio Mendonca on 8/17/17.
//  Copyright © 2017 Marco Antonio Mendonca. All rights reserved.
//

#import "BearTableViewController.h"
#import "BearDetailsViewController.h"
#import "Bear.h"
#import "BearDetail.h"

@interface BearTableViewController ()

@end

@implementation BearTableViewController

- (void) BearsJson {
    
    bearId = @"id";
    name = @"name";
    abv = @"abv";
    thumbnail = @"image_url";
    
    aBears = [[NSMutableArray alloc] init];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:
                            [NSURL URLWithString:@"https://api.punkapi.com/v2/beers"]];
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingMutableContainers error:nil];
    
    for (NSDictionary *dataDict in jsonObjects) {
        NSString *strBearID = [dataDict objectForKey:@"id"];
        NSString *strName = [dataDict objectForKey:@"name"];
        NSString *strAbv = [dataDict objectForKey:@"abv"];
        NSString *strThumbnail = [dataDict objectForKey:@"image_url"];
        
        dict = [NSDictionary dictionaryWithObjectsAndKeys:
               strBearID, bearId,
               strName, name,
               strAbv, abv,
               strThumbnail, thumbnail,
               nil];
        
        [aBears addObject:dict];
        
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Lista de Cervejas"];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self BearsJson];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [aBears count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle : UITableViewCellStyleSubtitle
                                      reuseIdentifier : CellIdentifier];
    }
    
    NSDictionary *tmpDict = [aBears objectAtIndex:indexPath.row];
    
    NSURL *url = [NSURL URLWithString:[tmpDict objectForKey:thumbnail]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *img = [[UIImage alloc] initWithData:data];
    cell.imageView.image = img;
    
    cell.textLabel.text = [tmpDict objectForKey:name];
    
    cell.detailTextLabel.text= [[tmpDict objectForKey:bearId] stringValue];
    
    cell.detailTextLabel.text= [[tmpDict objectForKey:abv] stringValue];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [aBears removeObjectAtIndex:indexPath.row];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *uiStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    BearDetailsViewController *bearDetailsView = [uiStoryboard instantiateViewControllerWithIdentifier:@"BearDetailsViewController"];
    
    NSDictionary *tmpDict = [aBears objectAtIndex:indexPath.row];
    
    bearDetailsView.idSelecionado = [[tmpDict objectForKey:bearId] intValue];
    [bearDetailsView setTitle:@"Bear Details"];
    
    [self.navigationController pushViewController:bearDetailsView animated:YES];
    
    //[self performSegueWithIdentifier:@"informacao" sender:self] ;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"BearDetailsViewController"]){
        BearDetailsViewController *bearDetailsView = [segue destinationViewController];
        [bearDetailsView setIdSelecionado: _bearIdSelected];
    }

}

@end
