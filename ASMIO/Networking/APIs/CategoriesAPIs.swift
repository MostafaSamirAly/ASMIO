//
//  CategoriesAPIs.swift
//  ASMIO
//
//  Created by Mostafa Samir on 19/11/2021.
//

import Foundation

import Alamofire

enum CategoriesPaths {
    static let productsInCategory = "products"
    static let productDetails = "products/get"
    
}

enum CategoriesApi: Requestable {
    
    case productsInCategory(categoryId: Int,page: Int)
    case productDetails(productId: Int)
    
    var path: String {
        switch self {
        case .productsInCategory:
            return CategoriesPaths.productsInCategory
        case .productDetails(let productId):
            return CategoriesPaths.productDetails
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .productsInCategory:
            return .get
        case .productDetails:
            return .get
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var urlParameters: Parameters? {
        switch self {
        case .productsInCategory(let categoryId, let page):
            return ["category_id": categoryId,
                    "page": page]
        case .productDetails(let productId):
            return ["product_id": productId]
        }
    }
}
