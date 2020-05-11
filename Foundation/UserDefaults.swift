//
//  UserDefaults.swift
//  nots
//
//  Created by Ivan Cantarino on 10/05/2020.
//  Copyright © 2020 Ivan Cantarino. All rights reserved.
//

import Foundation

extension UserDefaults {
	
	func isKeyPresent(key: String) -> Bool {
		return object(forKey: key) != nil
	}

	public enum Keys {
		static let setupDefaults = "setupDefaults"
		static let fontSize = "fontSize"
		static let themePreference = "themePreference"
		static let h1FontSize = "h1FontSize"
		static let h2FontSize = "h2FontSize"
		static let h3FontSize = "h3FontSize"
	}
	
	var setupDefaults: Bool {
		set {
			set(newValue, forKey: Keys.setupDefaults)
		}
		get {
			return bool(forKey: Keys.setupDefaults)
		}
	}
	
	var fontSize: Int {
		set {
			set(newValue, forKey: Keys.fontSize)
		}
		get {
			return integer(forKey: Keys.fontSize)
		}
	}
	
	var h1FontSize: Int {
		set {
			set(newValue, forKey: Keys.h1FontSize)
		}
		get {
			return integer(forKey: Keys.h1FontSize)
		}
	}
	
	var h2FontSize: Int {
		set {
			set(newValue, forKey: Keys.h2FontSize)
		}
		get {
			return integer(forKey: Keys.h2FontSize)
		}
	}
	
	var h3FontSize: Int {
		set {
			set(newValue, forKey: Keys.h3FontSize)
		}
		get {
			return integer(forKey: Keys.h3FontSize)
		}
	}
	
	var themePreference: Int {
		set {
			set(newValue, forKey: Keys.themePreference)
		}
		get {
			return integer(forKey: Keys.themePreference)
		}
	}
}
