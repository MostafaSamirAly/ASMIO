//
//  MyError.swift
//  ASMIO
//
//  Created by Mostafa Samir on 18/11/21.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import Foundation

public enum MyError: Error {
    case noInternet
    case badAPIRequest
    case unauthorized
    case unknown
    case serverError
    case timeout
    
}

extension MyError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noInternet:
            return "No Internet Connection"
        case .badAPIRequest:
            return "Bad Api Request"
        case .unauthorized:
            return "UnAuthorized"
        case .unknown:
            return "Something Went Wrong"
        case .serverError:
            return "Internal Server Error"
        case .timeout:
            return "Connection Timed Out"
        }
    }
}
