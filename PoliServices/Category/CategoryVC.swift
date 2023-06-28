//
//  CategoryVC.swift
//  PoliServices
//
//  Created by Flavio Dobler on 14/06/23.
//

import UIKit


class CategoryVC: UIViewController {

    var categoryScreen : CategoryScreen?
    var nome : String?
    var viewModel : CategoryViewModel?
    
    override func loadView() {
        self.categoryScreen = CategoryScreen()
        self.view = self.categoryScreen
        self.title = "Novo Serviço"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.backgroundColor = UIColor(red: 192/255, green: 219/255, blue: 234/255, alpha: 1)
        self.categoryScreen?.delegateCollectionView(delegate: self, datasource: self)
        self.navigationController?.title = "Novo Serviço"
        viewModel = CategoryViewModel()
        
    }
    
    
}

extension CategoryVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfCategories() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.identifier, for: indexPath) as? CustomCollectionCell
        if let category = viewModel?.category(at: indexPath) {
                    cell?.category = category
                }
                return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: view.frame.size.width/3 , height: view.frame.size.width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedCategory: String = ""
        
        if indexPath.row == 0 {
            selectedCategory = "Código"
        } else if indexPath.row == 1 {
            selectedCategory = "Carreira"
        } else if indexPath.row == 2 {
            selectedCategory = "Entrevista"
        } else if indexPath.row == 3 {
            selectedCategory = "Feedback"
        }
        
        let calendarVC = CalendarVC()
        calendarVC.categoryName = selectedCategory
        self.navigationController?.pushViewController(calendarVC, animated: true)
    }
}
        

    
    

