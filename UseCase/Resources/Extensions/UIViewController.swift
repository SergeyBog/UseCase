//
//  UIViewcontroller.swift
//  UseCase
//
//  Created by Sergey Bohachenko on 08.07.2022.
//

import Foundation
import UIKit

extension UIViewController {
    class var identifier: String {
        let separator = "."
        let fullName = String(describing: self)
        if fullName.contains(separator) {
            let items = fullName.components(separatedBy: separator)
            if let name = items.last {
                return name
            }
        }
        return fullName
    }
}
