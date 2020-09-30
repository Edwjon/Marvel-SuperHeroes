//
//  ViewController.swift
//  Marvel SuperHeroes
//
//  Created by Edward Pizzurro Fortun on 9/29/20.
//  Copyright © 2020 Edwjon. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    //MARK: - Array de los Héroes
    var heroes = [HeroesDetail]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHeroes()
        
        navigationItem.title = "Marvel Heroes"
        navigationController?.navigationBar.prefersLargeTitles = true

        
        collectionView.backgroundColor = .white
        collectionView.register(HeroCell.self, forCellWithReuseIdentifier: "cellId")
        
        //Configuración del Layout del collectionView
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width/2 - 10, height: width/2 - 10)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        collectionView.collectionViewLayout = layout
    }
    
    //MARK: - Llenar el array de los Héroes con la data tomada de la API
    func getHeroes() {
        let heroesRequest = HeroesRequest()
        heroesRequest.getHeroes { [weak self] result in
            
            switch result {
                case .failure(let error): print(error)
                case .success(let heroes): self?.heroes = heroes
            }
        }
    }
    
    //MARK: - Métodos CollectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! HeroCell
        
        let heroe = heroes[indexPath.item]
        cell.heroName.text = heroe.name
        cell.HeroImage.downloaded(from: "\(heroe.thumbnail.path)/standard_amazing.\(heroe.thumbnail.extension)")
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        let heroe = heroes[indexPath.item]
        
        detailVC.heroName.text = heroe.name
        detailVC.heroImage.downloaded(from: "\(heroe.thumbnail.path)/standard_amazing.\(heroe.thumbnail.extension)")
        
        if heroe.description != "" {
            detailVC.descriptionLabel.text = heroe.description
        
        } else {
            detailVC.descriptionLabel.text = "No description"
        }
        
        show(detailVC, sender: nil)
    }
    
}

