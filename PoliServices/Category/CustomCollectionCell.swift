//
//  CustomCollectionCell.swift
//  PoliServices
//
//  Created by Flavio Dobler on 15/06/23.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    static let identifier : String = "CustomCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true 
        self.backgroundColor = .white
        self.layer.cornerRadius = 10 
        self.setupSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    lazy var serviceTypeLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    lazy var serviceImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    var category : CategoryModel? {
        didSet {
            guard let categoryItem = category else {return }
            
            if let service = categoryItem.service {
                serviceTypeLabel.text = service
            }
            
            if let image = categoryItem.image{
                serviceImage.image = image
            }
            
            if let color = categoryItem.color {
                serviceImage.tintColor = color
            }
        }
    }
    
    
    
    private func setupSubviews(){
        self.addSubview(serviceTypeLabel)
        self.addSubview(serviceImage)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            self.serviceImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.serviceImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            
            self.serviceTypeLabel.topAnchor.constraint(equalTo: self.serviceImage.bottomAnchor, constant: 4),
            self.serviceTypeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }
    
    
}
