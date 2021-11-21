//
//  ErrorModel.swift
//  ExhibitSmart
//
//  Created by Asmaa Tarek on 15/06/2021.
//

import Foundation

struct ResponseModel<T: Codable>: Codable {
    let data: T?
    let meta: Meta?
    enum CodingKeys: String, CodingKey {
        case data
        case meta
    }
}

// MARK: - Meta
struct Meta: Codable {
    let currentPage, from, lastPage: Int?
    let path: String?
    let perPage, to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case path
        case perPage = "per_page"
        case to, total
    }
}
