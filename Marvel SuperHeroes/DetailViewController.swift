//
//  DetailViewController.swift
//  Marvel SuperHeroes
//
//  Created by Edward Pizzurro Fortun on 9/29/20.
//  Copyright © 2020 Edwjon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - Imagen del Héroe
    let heroImage: UIImageView = {
        let imagen = UIImageView()
        imagen.layer.cornerRadius = 20
        return imagen
    }()
    
    //MARK: - Etiqueta del Nombre del Héroe
    let heroName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    //MARK: - Etiqueta de la descripción del Héroe
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        //Añadir la imagen a la vista
        view.addSubview(heroImage)
        heroImage.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 100, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 200)
        
        //Añadir la etiqueta del nombre a la vista
        view.addSubview(heroName)
        heroName.anchor(heroImage.topAnchor, left: heroImage.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 200)
        
        //Añadir la etiqueta de la descripción a la vista
        view.addSubview(descriptionLabel)
        descriptionLabel.anchor(heroImage.bottomAnchor, left: heroImage.leftAnchor, bottom: nil, right: heroName.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)
    
    }
    
    
    


}
