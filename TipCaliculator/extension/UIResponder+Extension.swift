//
//  UIResponder+Extension.swift
//  TipCaliculator
//
//  Created by Vinod Nayak Banavath on 20/04/24.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
