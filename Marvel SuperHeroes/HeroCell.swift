//
//  HeroCell.swift
//  Marvel SuperHeroes
//
//  Created by Edward Pizzurro Fortun on 9/29/20.
//  Copyright © 2020 Edwjon. All rights reserved.
//

import UIKit

class HeroCell: UICollectionViewCell {
    
    let HeroImage: UIImageView = {
        let imagen = UIImageView()
        imagen.layer.cornerRadius = 20
        return imagen
    }()
    
    let heroName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(HeroImage)
        HeroImage.anchorCenterSuperview()
        HeroImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        HeroImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        addSubview(heroName)
        heroName.anchor(HeroImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 6, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 40)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

