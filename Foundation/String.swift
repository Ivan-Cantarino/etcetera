//
//  String.swift
//  nots
//
//  Created by Ivan Cantarino on 10/05/2020.
//  Copyright © 2020 Ivan Cantarino. All rights reserved.
//

import Foundation
import Down

extension String {
	/// Returns the Character at the given index
	public func getCharAtIndex(_ index: Int) -> Character {
		return self[self.index(self.startIndex, offsetBy: index)]
	}
	
	/// Returns a title up to 20 characters from the given string
	public var createTitle: String {
		if var str = getRawString(from: self) {
			str = str.trimmingCharacters(in: .whitespacesAndNewlines)
			if str.count > 20 {
				let index = str.index(startIndex, offsetBy: 17)
				let title = "\(String(str[..<index]))..."
				return title
			}
			return str
		}
		return ""
	}

	/// Returns a raw string without the Markdown syntax-style
	private func getRawString(from str: String) -> String? {
		return try? Down.init(markdownString: str).toAttributedString().string
	}
	
	public func getDate(withFormat format: String) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
		
		let dateObj = dateFormatter.date(from: self)
		dateFormatter.dateFormat = format
		
		return dateFormatter.string(from: dateObj!)
	}
}
