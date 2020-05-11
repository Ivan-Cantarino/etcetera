//
//  UIColor.swift
//  nots
//
//  Created by Ivan Cantarino on 10/05/2020.
//  Copyright © 2020 Ivan Cantarino. All rights reserved.
//

import Foundation

extension UIColor {
	
	/// reduces screen tearing on iPhone X
	static func mainBlack() -> UIColor {
		return UIColor(white: 0.05, alpha: 1)
	}
	
	convenience init(hex: Int, alpha: CGFloat = 1) {
		let r = CGFloat((hex & 0xFF0000) >> 16) / 255
		let g = CGFloat((hex & 0xFF00) >> 8) / 255
		let b = CGFloat((hex & 0xFF)) / 255
		self.init(red: r, green: g, blue: b, alpha: alpha)
	}
	
	/// Creates a color based on the given RED, GREEN, BLUE inputs
	@objc static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
	}
	
	/// Created a color with alpha component, based on the given r,g,b,a
	@objc static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		
		var _alpha = alpha / 100
		assert(_alpha >= 0 && _alpha <= 1, "Invalid alpha component")
		
		if _alpha > 1 { _alpha = 1 }
		if _alpha < 0 { _alpha = 0 }
		return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: _alpha)
	}
}
