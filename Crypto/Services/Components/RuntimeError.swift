//
//  RuntimeError.swift
//  Crypto
//
//  Created by Developer on 27.02.2023.
//

import Foundation

class RuntimeError: NSError {
    
    private let message: String
    private let errCode: Int
    
    init(_ message: String, domain: String = "Crypto.RuntimeError", code: Int = -1) {
        self.message = message
        self.errCode = code
        
        super.init(
            domain: domain,
            code: code,
            userInfo: [
                NSLocalizedDescriptionKey: message,
                NSLocalizedFailureErrorKey: message
            ])
    }
    
    required init?(coder: NSCoder) {
        self.message = "Crypto.RuntimeError"
        self.errCode = -1
        
        super.init(coder: coder)
    }
    
    override var description: String {
    #if DEBUG
        return "{\n\tCode: \(self.errCode)\n\tDescription: \(self.message)\n}"
    #else
        return self.message
    #endif
    }
}
