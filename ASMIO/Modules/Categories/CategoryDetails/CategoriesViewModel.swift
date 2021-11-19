//
//  ViewModel.swift
//  ASMIO
//
//  Created by Mostafa Samir on 19/11/2021.
//

import Foundation

class CategoriesViewModel: BaseViewModel {
    
    var products = [Product]()
    private let categoryID = 23
    var fetchProductsSuccess: (() -> Void)?
    
    func fetchProducts() {
        startRequest(request: CategoriesApi.productsInCategory(categoryId: categoryID), mappingClass: ResponseModel<[Product]>.self) { [weak self] response in
            self?.products = response?.data ?? []
            self?.fetchProductsSuccess?()
        }
    }
}
