//
//  NotificationCenter.swift
//  nots
//
//  Created by Ivan Cantarino on 10/05/2020.
//  Copyright © 2020 Ivan Cantarino. All rights reserved.
//

import Foundation

/// Quality-of-life extension of NotificationCenter.
extension NotificationCenter {

    /// Posts a notification using the default center.
		///
		/// - Parameters:
		///   - name: notification name to post
		///   - object: any object
		///   - userInfo: adicional information to pass with the notification
    public static func post(_ name: Notification.Name, object: Any? = nil, userInfo: [AnyHashable: Any]? = nil) {
			NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }

}

