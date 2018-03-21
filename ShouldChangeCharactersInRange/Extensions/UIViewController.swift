//
//  UIViewController.swift
//  ShouldChangeCharactersInRange
//
//  Created by Vlasiuk Dmitriy on 3/21/18.
//  Copyright © 2018 test.me. All rights reserved.
//

import UIKit


// MARK: - Presenters

public extension UIViewController {
    
    func present(alert title: String,  message: String? = nil, completion:(()->Void)? = nil) {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        alertController.addAction(
            UIAlertAction(title: "Ok", style: .cancel) 
        )
        
        present(alertController, animated: true, completion: completion)
    }
}
