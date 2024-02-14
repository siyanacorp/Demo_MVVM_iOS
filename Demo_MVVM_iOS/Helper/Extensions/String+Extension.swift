//
//  String+Extension.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
import UIKit

extension String {
    /**
     Converts HTML-formatted text to plain text.
     - Returns: A plain text representation of the HTML-formatted string, or `nil` if conversion fails.
     */
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
    
    /**
     Escapes special characters in the string by adding percent encoding.
     - Returns: A string with special characters replaced by their percent-encoded representation, or the original string if no changes are needed.
     */
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
