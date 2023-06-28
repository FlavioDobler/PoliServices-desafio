//
//  HomeVC.swift
//  PoliServices
//
//  Created by Flavio Dobler on 12/06/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var leadingOnScreen : CGFloat = 22
    var leadingEdgeOffScreen : CGFloat = -1000
    var topOnScreen : CGFloat = -20
    var topEdgeOffScreen : CGFloat = 1000
    var dateAndTime : CalendarVC?
    var titleLeadingAnchor : NSLayoutConstraint?
    var dateLabelLeadingAnchor : NSLayoutConstraint?
    var cardTopAnchor : NSLayoutConstraint?
   
    var viewModel : HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 192/255, green: 219/255, blue: 234/255, alpha: 1)
        self.layout()
        self.checkButton()
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animate()
        self.checkButton()
        self.setColor()
        
        
    }
    
    let serviceCard: HomeScreen = {
        let view = HomeScreen()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem-Vindo ao \nDevServices"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    lazy var dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        return label
    }()
    
    lazy var descriptionBackground : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        return view
    }()
    
    lazy var descriptionTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sobre nós"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A DevServices é o melhor aplicativo para reservar seu agendamento com serviços. Aqui é um espaço que você consegue reservar um espaço na minha agenda e vamos resolver suas dúvidas.\nSelecione o tipo de atendimento e vamos pra cima!\n\n*Ilustrativo"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var serviceRequestButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Solicitar novo Serviço", for: .normal)
        button.setTitleColor(.cyan, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(didTapServiceButton), for: .touchUpInside)
        button.isHidden = false
        return button
    }()
    
   
    
   
    
    @objc func didTapServiceButton(){
        let categoryVC = CategoryVC()
        self.navigationController?.pushViewController(categoryVC, animated: true)
    }
    

    private func checkButton(){
        if let text = serviceCard.informedDateLabel.text, !text.isEmpty {
            serviceRequestButton.isHidden = true
            serviceCard.isHidden = false
            self.animateCard()
        }else{
            serviceRequestButton.isHidden = false
            serviceCard.isHidden = true 
        }
    }
    
    private func setColor(){
        if serviceCard.typeServiceLabel.text == "Código"{
            serviceCard.serviceBackgroundView.backgroundColor = .cyan
        } else if serviceCard.typeServiceLabel.text == "Carreira" {
            serviceCard.serviceBackgroundView.backgroundColor = .green
        } else if serviceCard.typeServiceLabel.text == "Entrevista" {
            serviceCard.serviceBackgroundView.backgroundColor = .magenta
        } else {
            serviceCard.serviceBackgroundView.backgroundColor = .brown
        }
    }
    
    
    private func layout() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(dateLabel)
        self.view.addSubview(descriptionBackground)
        self.view.addSubview(descriptionTitleLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(lineView)
        self.view.addSubview(serviceRequestButton)
        self.view.addSubview(serviceCard)
        
        
        //Title
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32),
            //self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -22)
        ])
        
        self.titleLeadingAnchor = self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: leadingEdgeOffScreen)
        self.titleLeadingAnchor?.isActive = true
        
        
        //Date
        NSLayoutConstraint.activate([
            self.dateLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4),
            //self.dateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22)
        ])
        
        self.dateLabelLeadingAnchor = self.dateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: leadingEdgeOffScreen)
        self.dateLabelLeadingAnchor?.isActive = true
        
        //Background
        NSLayoutConstraint.activate([
            self.descriptionBackground.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 32),
            self.descriptionBackground.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12),
            self.descriptionBackground.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12),
            self.descriptionBackground.bottomAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            self.descriptionTitleLabel.topAnchor.constraint(equalTo: self.descriptionBackground.topAnchor, constant: 6),
            self.descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.descriptionBackground.leadingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.descriptionTitleLabel.bottomAnchor, constant: 4),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.descriptionBackground.leadingAnchor, constant: 12),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.descriptionBackground.trailingAnchor, constant: -12)
        ])
        
        //Line
        NSLayoutConstraint.activate([
            self.lineView.topAnchor.constraint(equalTo: self.descriptionBackground.bottomAnchor, constant: 32),
            self.lineView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 55),
            self.lineView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -55),
            self.lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        //Request Button
        NSLayoutConstraint.activate([
            self.serviceRequestButton.topAnchor.constraint(equalTo: self.lineView.bottomAnchor, constant: 20),
            self.serviceRequestButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12),
            self.serviceRequestButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12),
            self.serviceRequestButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        //Service Card View
        NSLayoutConstraint.activate([
            //self.serviceCard.topAnchor.constraint(equalTo: self.lineView.bottomAnchor,constant: 10),
            self.serviceCard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            self.serviceCard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20)
        ])
        
        self.cardTopAnchor = self.serviceCard.topAnchor.constraint(equalTo: self.lineView.topAnchor,constant: topEdgeOffScreen)
        self.cardTopAnchor?.isActive = true
            
    }
}

extension HomeVC {
    private func animate(){
        let animator1 = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut){
            self.titleLeadingAnchor?.constant = self.leadingOnScreen
            self.view.layoutIfNeeded()
        }
        let animator2 = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut){
            self.dateLabelLeadingAnchor?.constant = self.leadingOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        animator2.startAnimation()
        
    }
    
    private func animateCard(){
        let animator3 = UIViewPropertyAnimator(duration: 2, curve: .easeInOut){
            self.cardTopAnchor?.constant = self.topOnScreen
            self.view.layoutIfNeeded()
        }
        animator3.startAnimation()
    }
}
 

