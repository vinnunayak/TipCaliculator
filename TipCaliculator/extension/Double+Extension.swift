//
//  Double+Extension.swift
//  TipCaliculator
//
//  Created by Vinod Nayak Banavath on 25/04/24.
//

import Foundation

extension Double {
    var currencyFormated: String {
        var isWholeNumber: Bool {
            isZero ? true : !isNormal ? false: self == rounded()
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = isWholeNumber ? 0 : 2
        return formatter.string(from: self as NSNumber) ?? ""
    }
}
