//
//  NetworkConstants.swift
//  ASMIO
//
//  Created by Mostafa Samir on 18/11/21.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import Foundation
enum NetworkConstants {
    
    /// Base URLs
    static let baseURL = "https://demo.asmio.app/api/"
    
    /// The keys for HTTP header fields
    enum HTTPHeaderFieldKey: String {
        case authorization = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case string = "String"
    }
    
    /// The values for HTTP header fields
    enum HTTPHeaderFieldValue: String {
        case json = "application/json"
        case html = "text/html"
        case formEncode = "application/x-www-form-urlencoded"
        case accept = "*/*"
    }
}
