//
//  CalendarViewModel.swift
//  PoliServices
//
//  Created by Flavio Dobler on 22/06/23.
//

import Foundation
import UIKit

class CalendarViewModel {
    
    let defaults = UserDefaults.standard
    
    func setDefaults( categoria: String, data: UILabel, timeInterval: UIDatePicker ){
        defaults.set(categoria, forKey: "Categoria")
        defaults.set(data.text, forKey: "Date")
        defaults.set(timeInterval.date.timeIntervalSince1970, forKey: "service_date")
    }
    
}
