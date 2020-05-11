//
//  UITableViewCell.swift
//  nots
//
//  Created by Ivan Cantarino on 10/05/2020.
//  Copyright © 2020 Ivan Cantarino. All rights reserved.
//

import Foundation

extension UITableViewCell {
	
	func separator(hide: Bool) {
		separatorInset.left += hide ? bounds.size.width : 0
	}
}
