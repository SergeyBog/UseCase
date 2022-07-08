//
//  ArticleCoordinator.swift
//  UseCase
//
//  Created by Sergey Bohachenko on 08.07.2022.
//

import Foundation
import UIKit

protocol ArticleCoordinatorTransitions: AnyObject {
    
}

final class ArticleCoordinator {
    private weak var transitions: ArticleCoordinatorTransitions?
    private let navigationController: UINavigationController
    private weak var controller = Storyboard.auth.controller(withClass: ArticleViewController.self)
    
    init(navigationController: UINavigationController,transitions: ArticleCoordinatorTransitions?){
        self.navigationController = navigationController
        self.transitions = transitions
    }
    
    func start() {
        
    }
}
