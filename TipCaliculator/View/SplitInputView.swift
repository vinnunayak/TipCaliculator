//
//  SplitInputView.swift
//  TipCaliculator
//
//  Created by Vinod Nayak Banavath on 17/04/24.
//

import UIKit

class SplitInputView: UIView {

    init() {
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        backgroundColor = .blue
    }
}
