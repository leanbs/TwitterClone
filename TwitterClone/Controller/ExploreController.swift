//
//  ExploreController.swift
//  TwitterClone
//
//  Created by Davin on 05/03/20.
//  Copyright © 2020 Leanbs. All rights reserved.
//

import UIKit

class ExploreController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Explore"
    }
}
