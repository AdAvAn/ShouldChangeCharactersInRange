//
//  Constants.swift
//  ShouldChangeCharactersInRange
//
//  Created by Vlasiuk Dmitriy on 3/21/18.
//  Copyright © 2018 test.me. All rights reserved.
//

import Foundation

struct Constants {
    public struct RegEx {
        public static let EMAIL = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    }
    
    public static var minPasswordCount: Int = 6
}
