//
//  UIStoryboard.swift
//  UseCase
//
//  Created by Sergey Bohachenko on 08.07.2022.
//

import UIKit
struct Storyboard {
    static let auth = UIStoryboard(name: "Auth", bundle: nil)
    static let app = UIStoryboard(name: "App", bundle: nil)
 
}

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self.self)
    }
}

extension UIStoryboard {
    
    func controller<T: UIViewController>(withClass: T.Type) -> T? {
        let identifier = withClass.identifier
        return instantiateViewController(withIdentifier: identifier) as? T
    }
    
    func instantiateViewController<T: StoryboardIdentifiable>() -> T? {
        return instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T
    }
}

extension UIViewController: StoryboardIdentifiable { }
