//
//  ViewController.swift
//  ProyectoTienda
//
//  Created by Usuario invitado on 28/9/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tablita1: UITableView!
    
    var productoTotales = [Productos]()
    var carrito = [Productos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productoTotales.append(Productos(nombre: "Manzanas", presio: 15.0 , imagen: "Manzanas",cantidad: 0))
        productoTotales.append(Productos(nombre: "Melon", presio: 23.0 , imagen: "melon",cantidad: 0))
        productoTotales.append(Productos(nombre: "Sandia", presio: 5.0 , imagen: "sandia",cantidad: 0))
        productoTotales.append(Productos(nombre: "Platano", presio: 20.0 , imagen: "platano",cantidad: 0))
        productoTotales.append(Productos(nombre: "Uva", presio: 10.0 , imagen: "uva",cantidad: 0))
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productoTotales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = productoTotales[indexPath.row].nombre
        cell.imageView?.image = UIImage(named: productoTotales[indexPath.row].imagen)
    return cell
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vista2"{
             let indexPath = tablita1.indexPathForSelectedRow
            let destino = segue.destination as! SecondViewController
            destino.prodcutoSelecionado = productoTotales[(indexPath?.row)!]
            destino.seleccionado = (indexPath?.row)!
            
            
        }
        
        if segue.identifier == "vista3"{
            for i in 0...productoTotales.count - 1 {
                if productoTotales[i].cantidad > 0 {
                    carrito.append(productoTotales[i])
                }
            }
            
            
        }
        
    }
    
    @IBAction func unwindToUno(_ segue: UIStoryboardSegue) {
        if let origin = segue.source as? SecondViewController{
            let data = origin.prodcutoSelecionado
            let data2 = origin.seleccionado
            
            print(data)
            productoTotales[data2].cantidad = (data?.cantidad)!
            //print(productoTotales)
            
            
        }
        // Use data from the view controller which initiated the unwind segue
    }
   
   

}

