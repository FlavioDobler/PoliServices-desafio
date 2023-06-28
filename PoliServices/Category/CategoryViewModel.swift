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
        
        private func populateCategories() { // Deveria ter preenchido o array na ViewModel?
            categories = CategoryModel.getCategory()
        }
        
        func numberOfCategories() -> Int {
            return categories.count
        }
        
        func category(at indexPath: IndexPath) -> CategoryModel {
            return categories[indexPath.row]
        }
    
}

