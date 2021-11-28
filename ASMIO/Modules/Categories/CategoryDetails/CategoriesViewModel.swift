//
//  ViewModel.swift
//  ASMIO
//
//  Created by Mostafa Samir on 19/11/2021.
//

import Foundation

class CategoriesViewModel: BaseViewModel {
    
    private var products = [Product]() {
        didSet {
            applySorting()
        }
    }
    private(set) var sortedProducts = [Product]()
    private let categoryID = 16
    private(set) var shouldPaginate = false
    private var currentPage = 1
    var reloadData: (() -> Void)?
    var sortingOption: SortOptions = .popularity {
        didSet {
            applySorting()
            reloadData?()
        }
    }
    
    func fetchProducts() {
        startRequest(request: CategoriesApi.productsInCategory(categoryId: categoryID, page: currentPage), mappingClass: ResponseModel<[Product]>.self) { [weak self] response in
            self?.products.append(contentsOf: response?.data ?? [])
            self?.currentPage += 1
            self?.shouldPaginate = (self?.currentPage ?? 1) < (response?.meta?.lastPage ?? 1)
            self?.reloadData?()
        }
    }
    
    func applySorting() {
        
        switch sortingOption {
        case .popularity:
            sortedProducts = products
        case .highToLow:
            sortedProducts = products.sorted(by: { first, second in
                let firstFinalPrice = Double(first.finalPrice?.dropFirst(4).replacingOccurrences(of: ",", with: "") ?? "0.0") ?? 0.0
                let secondFinalPrice = Double(second.finalPrice?.dropFirst(4).replacingOccurrences(of: ",", with: "") ?? "0.0") ?? 0.0
                return firstFinalPrice > secondFinalPrice
            })
        case .lowToHigh:
            sortedProducts = products.sorted(by: { first, second in
                let firstFinalPrice = Double(first.finalPrice?.dropFirst(4).replacingOccurrences(of: ",", with: "") ?? "0.0") ?? 0.0
                let secondFinalPrice = Double(second.finalPrice?.dropFirst(4).replacingOccurrences(of: ",", with: "") ?? "0.0") ?? 0.0
                return firstFinalPrice < secondFinalPrice
            })
        }
    }
}
