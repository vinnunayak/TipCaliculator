//
//  String+Extesion.swift
//  TipCaliculator
//
//  Created by Vinod Nayak Banavath on 19/04/24.
//

import Foundation

extension String {
    var doubleValue: Double? {
        return Double(self)
    }
}

extension String {
    func getAttributedAmountText() -> NSMutableAttributedString {
        let text = NSMutableAttributedString(
            string: self,
            attributes: [
                .font: ThemeFont.bold(ofSize: 24)
            ])
        text.addAttributes([
            .font: ThemeFont.bold(ofSize: 16)],
            range: NSMakeRange(0, 1))
        return text
    }
}
