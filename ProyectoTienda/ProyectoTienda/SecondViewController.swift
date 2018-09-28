//
//  SecondViewController.swift
//  ProyectoTienda
//
//  Created by Usuario invitado on 28/9/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var vista: UIImageView!
    
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var cantidad: UILabel!
    
    var prodcutoSelecionado: Productos!
    var seleccionado: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        vista.image = UIImage(named: prodcutoSelecionado.imagen)
        nombre.text = "\(prodcutoSelecionado.nombre) $ \(prodcutoSelecionado.presio)"
        cantidad.text = String(prodcutoSelecionado.cantidad)
        
        // Do any additional setup after loading the view.
    }

    
    

    @IBAction func restar(_ sender: UIButton) {
        if prodcutoSelecionado.cantidad > 0{
             prodcutoSelecionado.cantidad = prodcutoSelecionado.cantidad - 1
             viewDidLoad()
        }
        
    }
    
    
    @IBAction func mas(_ sender: UIButton) {
        prodcutoSelecionado.cantidad = prodcutoSelecionado.cantidad + 1
        //print(prodcutoSelecionado.cantidad)
        viewDidLoad()
    }
    
}
