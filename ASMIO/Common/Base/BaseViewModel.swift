//
//  BaseViewModel.swift
//  ExhibitSmart
//
//  Created by Asmaa Tarek on 11/05/2021.
//

import Foundation
import PromiseKit

public enum State {
    case loading
    case error
    case empty
    case populated
}

class BaseViewModel: NSObject {
    private let api = Api()
    var updateLoadingStatus: (()->())?
    var updateError: ((String)->())?
    var state: State = .empty {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    func startRequest<M: Codable>(request: Requestable, mappingClass: M.Type,successCompletion: @escaping((M?) -> Void), showLoading: Bool = true) {
        
        if showLoading {
            state = .loading
        }
        
        api.fireRequestWithSingleResponse(urlConvertible: request, mappingClass: M.self).done {[weak self] success in
            self?.state = .populated
            successCompletion(success)
        }.catch {[weak self] error in
            self?.state = .error
            self?.updateError?(error.localizedDescription)
        }
    }
}
