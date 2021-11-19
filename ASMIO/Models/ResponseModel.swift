//
//  ErrorModel.swift
//  ExhibitSmart
//
//  Created by Asmaa Tarek on 15/06/2021.
//

import Foundation

struct ResponseModel<T: Codable>: Codable {
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
