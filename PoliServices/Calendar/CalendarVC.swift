//
//  CalendarVC.swift
//  PoliServices
//
//  Created by Flavio Dobler on 18/06/23.
//

import UIKit
import Foundation


class CalendarVC: UIViewController {

    
    var categoryName: String? {
            didSet {
                updateServiceLabelText()
            }
        }
    
    var home : HomeVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.addSubviews()
        self.setupConstraints()
        self.title = "Novo Serviço"
        updateServiceLabelText()
        self.view.backgroundColor = UIColor(red: 192/255, green: 219/255, blue: 234/255, alpha: 1)
        
        //Ver ViewCotrollers na stack
        if let viewControllers = navigationController?.viewControllers {
            for viewController in viewControllers {
                print("View Controller: \(viewController)")
            }
        }
    }
    
    lazy var dateLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
       return label
    }()
    
     lazy var serviceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // label.text = "Selecione a data e hora \npara reservar o serviço de \( categoryName ?? "")"
        label.contentMode = .left
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var confirmButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapConfirm), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 175/255, green: 230/255, blue: 220/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.5
        return button
    }()
     
    func updateServiceLabelText() {
        serviceLabel.text = "Selecione a data e hora para reservar \no serviço de \(categoryName ?? "")"
    }
    

   
    lazy var datePicker: UIDatePicker = {
            let picker = UIDatePicker()
            picker.locale = .current
            picker.datePickerMode = .dateAndTime
            // picker.state = .selected // Não funciona antes do iOS 13
            picker.translatesAutoresizingMaskIntoConstraints = false
            picker.backgroundColor = UIColor(red: 192/255, green: 219/255, blue: 234/255, alpha: 1)
            picker.minimumDate = Date()
            picker.date = Calendar.current.date(byAdding: .minute, value: 1, to: Date()) ?? Date()
            picker.addTarget(self, action: #selector(didTapDateSelector), for: .valueChanged)
            return picker
        }()
    
   
    
    
    @objc func didTapDateSelector(){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            let dateString = dateFormatter.string(from: datePicker.date)
            
            dateLabel.text = "Data selecionada: \(dateString)"
    }
   
    @objc func didTapConfirm(){
        if let homeVC = navigationController?.viewControllers.first(where: { $0 is HomeVC }) as? HomeVC {
            
            homeVC.serviceCard.typeServiceLabel.text = categoryName
            //print("Selected date:", dateLabel.text!)
            homeVC.serviceCard.informedDateLabel.text = dateLabel.text
            navigationController?.popToViewController(homeVC, animated: true)
                    }
    }
    
    
    private func addSubviews(){
        self.view.addSubview(datePicker)
        self.view.addSubview(serviceLabel)
        self.view.addSubview(dateLabel)
        self.view.addSubview(confirmButton)
    }
    
    
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            self.serviceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            self.serviceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            self.serviceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                    
            self.datePicker.topAnchor.constraint(equalTo: serviceLabel.bottomAnchor, constant: 20),
            self.datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            self.datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            self.datePicker.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -40),
            
            self.dateLabel.topAnchor.constraint(equalTo: self.datePicker.bottomAnchor,constant: 100),
            self.dateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            self.confirmButton.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor,constant: 20),
            self.confirmButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 40),
            self.confirmButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -40),
            self.confirmButton.heightAnchor.constraint(equalToConstant: 50)
                    
               ])
    }
    
}


