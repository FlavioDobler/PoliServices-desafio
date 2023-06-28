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
}

//        if serviceCard.typeServiceLabel.text == "Código"{
//            serviceCard.serviceBackgroundView.backgroundColor = .cyan
//        } else if serviceCard.typeServiceLabel.text == "Carreira" {
//            serviceCard.serviceBackgroundView.backgroundColor = .green
//        } else if serviceCard.typeServiceLabel.text == "Entrevista" {
//            serviceCard.serviceBackgroundView.backgroundColor = .magenta
//        } else {
//            serviceCard.serviceBackgroundView.backgroundColor = .brown
//        }
    
    

