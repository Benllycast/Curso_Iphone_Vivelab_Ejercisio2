//
//  MasterTableViewController.m
//  Ejercicio2
//
//  Created by Jonathan Pacheco on 12/20/14.
//  Copyright (c) 2014 Jonathan Pacheco. All rights reserved.
//

#import "MasterTableViewController.h"
#import "DetailViewController.h"
#import "AddCellViewController.h"

@interface MasterTableViewController ()

@property (nonatomic, strong) NSMutableArray    *titles;
@property (nonatomic, strong) NSMutableArray    *subtitles;
@property (nonatomic, assign) NSInteger          selectedIndex;

@end

@implementation MasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = [NSMutableArray array];
    self.subtitles = [NSMutableArray array];
}

// Método del protocolo encargado de agregar una celda a la tabla
- (void)addCellWithTitle:(NSString *)title andSubtitle:(NSString *)subtitle {
    [self.titles addObject:title];
    [self.subtitles addObject:subtitle];
    // Refrescamos los datos de la tabla, para que se vean los cambios
    [self.tableView reloadData];
}

#pragma mark - Table view data source

// Numero de secciones en la tabla
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Numero de filas por seccion de la tabla
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

// Retorna celda de cada seccion de la tabla
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.titles[indexPath.row];
    cell.detailTextLabel.text = self.subtitles[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

// Ejecuta después de seleccionar una fila de la tabla
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Guardamos el valor temporal del indice seleccionado
    self.selectedIndex = indexPath.row;
    // Ejecutamos la transición de un segue
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
}

#pragma mark - Navigation methods

// Se ejecuta antes de hacer la navegación de un segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Preguntamos si el segue al que vamos es el deseado
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        // Asignamos el indice seleccionado al controlador de destino
        [segue.destinationViewController setSelectedIndex:self.selectedIndex];
    } else if ([segue.identifier isEqualToString:@"addCellSegue"]) {
        AddCellViewController *viewController = (AddCellViewController *)segue.destinationViewController;
        viewController.delegate = self;
    }
}

@end
