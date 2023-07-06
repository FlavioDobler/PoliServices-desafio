//
//  CategoryViewModel.swift
//  PoliServices
//
//  Created by Flavio Dobler on 20/06/23.
//

import Foundation
import UIKit

class CategoryViewModel {
    
    private var categories: [CategoryModel] = []
        
        init() {
            populateCategories()
        }
        
        private func populateCategories() { 
            categories = getCategory()
        }
        
        func numberOfCategories() -> Int {
            return categories.count
        }
        
        func category(at indexPath: IndexPath) -> CategoryModel {
            return categories[indexPath.row]
        }
    
     func getCategory () -> [CategoryModel]{
        let category = [
            CategoryModel(service: "Código", image: UIImage(named: "pencil.slash")?.withRenderingMode(.alwaysTemplate), color: .cyan),
            CategoryModel(service: "Carreira", image: UIImage(named: "graduationcap.circle.fill")?.withRenderingMode(.alwaysTemplate), color: .green),
            CategoryModel(service: "Entrevista", image: UIImage(named:"books.vertical.fill")?.withRenderingMode(.alwaysTemplate), color: .magenta),
            CategoryModel(service: "Feedback", image: UIImage(named:"scribble.variable")?.withRenderingMode(.alwaysTemplate), color: .brown)
        ]
        return category
    }
    
}

