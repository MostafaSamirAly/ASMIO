//
//  RequestParameters.swift
//  ASMIO
//
//  Created by Mostafa Samir on 18/11/21.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import UIKit

protocol RequestParameters: Codable {
    func getParamsAsJson() -> [String: Any]
}

extension RequestParameters {
    func getParamsAsJson() -> [String: Any] {
        let jsonEncoder = JSONEncoder()

        guard let jsonData = try? jsonEncoder.encode(self) else {
            return [:]
        }
        guard let dictionary = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] else {
            return [:]
        }
        debugPrint(dictionary)
        return dictionary
    }
}
