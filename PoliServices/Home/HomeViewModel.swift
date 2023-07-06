//
//  HomeViewModel.swift
//  PoliServices
//
//  Created by Flavio Dobler on 13/06/23.
//

import Foundation
import UIKit


class HomeViewModel {
    
    public func serviceCardColor ( label: String) -> UIColor {
        switch label{
        case "Código" :
            return .cyan
        case "Carreira" :
            return .green
        case "Entrevista":
            return .magenta
        default:
            return .brown
        }
        
    }
   
    func checkButton(serviceCard: HomeScreen, button : UIButton) -> Bool {
        let currentDate = Date()
        let serviceDateInteger = UserDefaults.standard.integer(forKey: "service_date")
        let serviceDate = Date(timeIntervalSince1970: TimeInterval(serviceDateInteger))
        let hasService = serviceDate >= currentDate
        
        if hasService {
            serviceCard.informedDateLabel.text = UserDefaults.standard.string(forKey: "Date")
            serviceCard.nextServiceLabel.text = UserDefaults.standard.string(forKey: "Categoria")
            button.isHidden = true
            serviceCard.isHidden = false
            return true
           // self.presentAnimateCard() por na HomeVC
        }else{
            UserDefaults.standard.removeObject(forKey: "Date")
            UserDefaults.standard.removeObject(forKey: "Categoria")
            button.isHidden = false
            serviceCard.isHidden = true
            return false 
       }
    }
    
//    private func checkButton(){
//        let currentDate = Date()
//        let serviceDateInteger = UserDefaults.standard.integer(forKey: "service_date")
//        let serviceDate = Date(timeIntervalSince1970: TimeInterval(serviceDateInteger))
//        let hasService = serviceDate >= currentDate
//
//        if hasService {
//            serviceCard.informedDateLabel.text = UserDefaults.standard.string(forKey: "Date")
//            serviceCard.nextServiceLabel.text = UserDefaults.standard.string(forKey: "Categoria")
//            serviceRequestButton.isHidden = true
//            serviceCard.isHidden = false
//            self.presentAnimateCard()
//        }else{
//            UserDefaults.standard.removeObject(forKey: "Date")
//            UserDefaults.standard.removeObject(forKey: "Categoria")
//            serviceRequestButton.isHidden = false
//            serviceCard.isHidden = true
//        }
//    }
//
//    private func initTimer(){
//            let now: Date = Date()
//            let calendar: Calendar = Calendar.current
//            let currentSeconds: Int = calendar.component(.second, from: now)
//            let timer = Timer(
//                fire: now.addingTimeInterval(Double(60 - currentSeconds + 1)),
//                interval: 60,
//                repeats: true,
//                block: { (t: Timer) in
//                    self.checkButton()
//                })
//            RunLoop.main.add(timer, forMode: .default)
//            self.timer = timer
//        }
//
    
}
