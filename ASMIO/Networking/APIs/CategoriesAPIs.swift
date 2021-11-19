//
//  CategoriesAPIs.swift
//  ASMIO
//
//  Created by Mostafa Samir on 19/11/2021.
//

import Foundation

import Alamofire

enum CategoriesPaths {
    static let productsInCategory = "products?category_id="
    static let productDetails = "products/get?product_id="
    
}

enum CategoriesApi: Requestable {
    
    case productsInCategory(categoryId: Int)
    case productDetails(productId: Int)
    
    var path: String {
        switch self {
        case .productsInCategory(let categoryId):
            return CategoriesPaths.productsInCategory + categoryId.description
        case .productDetails(let productId):
            return CategoriesPaths.productDetails + productId.description
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
        switch self {
        default:
            return nil
        }
    }
}
