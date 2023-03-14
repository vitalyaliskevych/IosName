//
//  String.swift
//  Crypto
//
//  Created by Developer on 25.01.2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    func localizedWithVars(vars: CVarArg...) -> String {
        return String(
            format: localized,
            arguments: vars
        )
    }
    
    func toDate(withFormat format: String = "MM/dd/yyyy")-> Date?{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date
        
    }
    
    func toDateCoin(withFormat format: String = "MM/dd/yyyy HH:mm")-> Date?{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func convertCoin(time: String) -> String {
        
        let toDate = time.description.toDateCoin()
        let temp = offsetFromNowString(for: toDate ?? Date.now)
        
        return temp
    }
    
    func convertGraph(time: String) -> String {
        
        let toDate = time.description.toDate()
        guard let toString = toDate?.toString() else { return "Error" }
        return toString
    }
    
    func offsetFromNowString(for otherDate: Date) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .day]
        formatter.includesApproximationPhrase = false
        formatter.maximumUnitCount = 1
        let offset = Date().distance(to: otherDate)
        let offsetSuffix = " ago"
        return (formatter.string(from: fabs(offset)) ?? "") + offsetSuffix
    }
}
