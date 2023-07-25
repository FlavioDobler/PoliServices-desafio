//
//  HomeViewModel.swift
//  PoliServices
//
//  Created by Flavio Dobler on 13/06/23.
//

import Foundation
import UIKit

protocol HomeScreenDelegate : AnyObject {
    func hasService()
    func showButton()
}

class HomeViewModel   {
    
    weak var delegate : HomeScreenDelegate?
   
    private var timer: Timer?
    
    
    public func serviceCardColor ( label: String) -> UIColor {
        switch label{
        case "Código" :
            return .cyan
        case "Carreira" :
            return .green
        case "Entrevista":
            return .magenta
        case "Feedback":
            return .brown
        default:
            return .clear
        }
        
    }
   
    func checkButton(serviceCard: HomeScreen, button : UIButton, cancelButton: UIButton) -> Bool {
        let currentDate = Date()
        let serviceDateInteger = UserDefaults.standard.integer(forKey: "service_date")
        let serviceDate = Date(timeIntervalSince1970: TimeInterval(serviceDateInteger))
        let hasService = serviceDate >= currentDate
        
        if hasService {
            serviceCard.informedDateLabel.text = UserDefaults.standard.string(forKey: "Date")
            serviceCard.typeServiceLabel.text = UserDefaults.standard.string(forKey: "Categoria")
            button.isHidden = true
            serviceCard.isHidden = false
            cancelButton.isHidden = false
            delegate?.hasService()
            return true
        }else{
            UserDefaults.standard.removeObject(forKey: "Date")
            UserDefaults.standard.removeObject(forKey: "Categoria")
            button.isHidden = false
            cancelButton.isHidden = true 
            delegate?.showButton()
            return false 
       }
    }
    
    func initTimer(callback: @escaping () -> Bool) {
        let now = Date()
        let calendar = Calendar.current
        let currentSeconds = calendar.component(.second, from: now)
        let timer = Timer(fire: now.addingTimeInterval(Double(60 - currentSeconds + 1)), interval: 60, repeats: true) { timer in
            let shouldContinue = callback()
            if !shouldContinue {
                timer.invalidate()
            }
        }
        RunLoop.main.add(timer, forMode: .default)
        self.timer = timer
    }
}
    
