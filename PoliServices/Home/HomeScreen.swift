//
//  HomeScreen.swift
//  PoliServices
//
//  Created by Flavio Dobler on 12/06/23.
//

import UIKit



class HomeScreen: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var nextServiceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Próximo Serviço"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var serviceBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.backgroundColor = .cyan
        return view
    }()
    
    lazy var typeServiceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var informedDateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Próxio Serviço"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var bookImage : UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "book.fill")
        return img
    }()
   
    
    private func layout(){
        self.addSubview(serviceBackgroundView)
        self.addSubview(nextServiceLabel)
        self.addSubview(typeServiceLabel)
        self.addSubview(informedDateLabel)
        self.addSubview(bookImage)
        
        NSLayoutConstraint.activate([
        
        
            self.nextServiceLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.nextServiceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            self.serviceBackgroundView.topAnchor.constraint(equalTo: self.nextServiceLabel.bottomAnchor,constant: 10),
            self.serviceBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.serviceBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.serviceBackgroundView.heightAnchor.constraint(equalToConstant: 150),
            
            self.typeServiceLabel.topAnchor.constraint(equalTo: serviceBackgroundView.topAnchor,constant: 20),
            self.typeServiceLabel.leadingAnchor.constraint(equalTo: serviceBackgroundView.leadingAnchor,constant: 20),
            
            self.informedDateLabel.topAnchor.constraint(equalTo: self.typeServiceLabel.bottomAnchor,constant: 20),
            self.informedDateLabel.leadingAnchor.constraint(equalTo: self.serviceBackgroundView.leadingAnchor,constant: 20),
            
            self.bookImage.topAnchor.constraint(equalTo: self.serviceBackgroundView.topAnchor,constant: 10),
            self.bookImage.trailingAnchor.constraint(equalTo: self.serviceBackgroundView.trailingAnchor,constant: -10)
        
        
        
        
        ])
        
    }
   
}

