//
//  String+humanify.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 6/26/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation

extension String {
    func humanify() -> String {
        if self.isEmpty { return "" }
        let step1 = self.replace("_", " ").replace(".", " - ")
        let regex = try? NSRegularExpression(pattern: "([a-z0-9])([A-Z])", options: [])
        return regex!.stringByReplacingMatches(
            in: step1,
            options: [],
            range: NSRange(location: 0, length: step1.count),
            withTemplate: "$1_$2"
        ).trimmingCharacters(in: .whitespaces)
    }
}
