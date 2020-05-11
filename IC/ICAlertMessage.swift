//
//  ICAlertMessage.swift
//  Cozynote
//
//  Created by Ivan Cantarino on 17/02/2019.
//  Copyright © 2019 Ivan Cantarino. All rights reserved.
//

import UIKit

class ICAlertMessage: UIView {
	
	enum AlertType {
		case success
		case error
	}
	
	private var alertColor: UIColor = .clear
	private var mainView: UIView?
	private var topHeight: CGFloat = 0.0
	
	public func presentAlert(in view: UIView, withMessage message: String, ofType alertType: AlertType, withTopHeight topHeight: CGFloat) {
		// adds and anchors the view
		mainView = view
		self.topHeight = topHeight
		view.addSubview(self)
		self.frame = CGRect(x: 24, y: -300, width: view.frame.width - 48, height: 100)
		
		alertColor = (alertType == .success) ? UIColor.rgb(red: 122, green: 188, blue: 160) : UIColor.rgb(red: 255, green: 59, blue: 48)
		self.backgroundColor = alertColor
		self.layer.cornerRadius = 8
		
		// configure the message label
		let messageLabel: UILabel = UILabel()
		messageLabel.text = message
		messageLabel.textAlignment = .center
		messageLabel.backgroundColor = .clear
		messageLabel.textColor = .white
		messageLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
		self.addSubview(messageLabel)
		messageLabel.fillSuperview()
		
		onMainQueueAsyncAfter(0.25) {
			self.animateIn()
		}
	}
	
	private func animateIn() {
		UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
			guard let _mainView = self.mainView else { return }
			self.frame = CGRect(x: 24, y: self.topHeight + 8, width: _mainView.frame.width - 48, height: 50)
		}) { _ in
			onMainQueueAsyncAfter(0.5, {
				self.animateOut()
			})
		}
	}
	
	private func animateOut() {
		// on completion removes the self from the mainView and sets the mainView to `nil`
		UIView.animate(withDuration: 2, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
			guard let _mainView = self.mainView else { return }
			self.frame = CGRect(x: 24, y: -300, width: _mainView.frame.width - 48, height: 50)
		}) { _ in
			self.removeFromSuperview()
			self.mainView = nil
		}
	}
}
