//
//  CategoryScreen.swift
//  PoliServices
//
//  Created by Flavio Dobler on 15/06/23.
//

import UIKit

class CategoryScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView : UICollectionView = {
        let collection = UICollectionView(frame: CGRect.init(), collectionViewLayout: UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        collection.setCollectionViewLayout(layout, animated: false)
        collection.backgroundColor = UIColor(red: 192/255, green: 219/255, blue: 234/255, alpha: 1)
        return collection
    }()
    
    public func delegateCollectionView(delegate : UICollectionViewDelegate, datasource: UICollectionViewDataSource){
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = datasource
        
    }
    
    private func setupSubviews(){
        self.addSubview(collectionView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            self.collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 20),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
