//
//  Date.swift
//  nots
//
//  Created by Ivan Cantarino on 10/05/2020.
//  Copyright © 2020 Ivan Cantarino. All rights reserved.
//

import Foundation


extension Date {
	/// Returns a string date with the desired format type
	/// - format: "dd-MM-yyyy" | "dd/MM/yy"
	public func toString(withFormat format: String) -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = format
		return  formatter.string(from: self)
	}
}
