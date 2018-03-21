//
//  String.swift
//  ShouldChangeCharactersInRange
//
//  Created by Vlasiuk Dmitriy on 3/21/18.
//  Copyright © 2018 test.me. All rights reserved.
//

import Foundation

extension String {
    
    /// Check if string is valid email format.
    var isEmail: Bool {
        return match(Constants.RegEx.EMAIL)
    }
    
    /// Check if string contains only numbers.
    var passwordIsCorrect: Bool {
        return self.count >= Constants.minPasswordCount
    }
    
    /// Matches a string using a regular expression pattern.
    ///
    /// - Parameters:
    ///   - pattern: the regular expression value
    ///   - caseSensitive: case-sensitive search
    /// - Returns: whether the regex matches in the string
    func match(_ pattern: String, caseSensitive: Bool = false) -> Bool {
        // Determine options
        var options: CompareOptions = [.regularExpression]
        if !caseSensitive {
            options.insert(.caseInsensitive)
        }
        
        return range(of: pattern, options: options) != nil
    }

}
