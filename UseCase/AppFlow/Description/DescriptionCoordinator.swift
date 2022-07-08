//
//  DescriptionCoordinator.swift
//  UseCase
//
//  Created by Sergey Bohachenko on 08.07.2022.
//

import Foundation
import UIKit

protocol DescriptionCoordinatorTransitions: AnyObject {
    
}

final class DescriptionCoordinator {
    private weak var transitions: DescriptionCoordinatorTransitions?
    private let navigationController: UINavigationController
    private weak var controller = Storyboard.auth.controller(withClass: DescriptionViewController.self)
    
    init(navigationController: UINavigationController,transitions: DescriptionCoordinatorTransitions?){
        self.navigationController = navigationController
        self.transitions = transitions
    }
    
    func start() {
        
    }
}
