//
//  CategoryModel.swift
//  PoliServices
//
//  Created by Flavio Dobler on 15/06/23.
//

import Foundation
import UIKit

struct CategoryModel {
    var service : String?
    var image : UIImage?
    var color : UIColor?
    
    
    
    static func getCategory () -> [CategoryModel]{
        let category = [
            CategoryModel(service: "Código", image: UIImage(named: "pencil.slash")?.withRenderingMode(.alwaysTemplate), color: .cyan),
            CategoryModel(service: "Carreira", image: UIImage(named: "graduationcap.circle.fill")?.withRenderingMode(.alwaysTemplate), color: .green),
            CategoryModel(service: "Entrevista", image: UIImage(named:"books.vertical.fill")?.withRenderingMode(.alwaysTemplate), color: .magenta),
            CategoryModel(service: "Feedback", image: UIImage(named:"scribble.variable")?.withRenderingMode(.alwaysTemplate), color: .brown)
        ]
        return category
    }
}
