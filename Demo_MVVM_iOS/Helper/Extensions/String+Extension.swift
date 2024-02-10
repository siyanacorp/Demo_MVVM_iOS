//
//  String+Extension.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
import UIKit

extension String {
    func convertHTMLToPlainText() -> String? {
        guard let data = self.data(using: .utf8) else { return nil }
        do {
            let attributedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            return attributedString.string
        } catch {
            print("Error converting HTML to plain text: \(error)")
            return nil
        }
    }
}
