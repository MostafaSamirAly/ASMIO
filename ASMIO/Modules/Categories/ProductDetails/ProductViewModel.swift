//
//  ProductViewModel.swift
//  ASMIO
//
//  Created by Mostafa Samir on 21/11/2021.
//

import Foundation

class ProductViewModel: BaseViewModel {
    let productId: Int
    var product: Product?
    var productFetchingSuccess: (() -> Void)?
    init(productId: Int) {
        self.productId = productId
    }
    
    func fetchProduct() {
        startRequest(request: CategoriesApi.productDetails(productId: productId), mappingClass: ResponseModel<Product>.self) { [weak self] response in
            self?.product = response?.data
            self?.productFetchingSuccess?()
        }
    }
}
