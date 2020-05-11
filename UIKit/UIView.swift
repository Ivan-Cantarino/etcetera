//
//  UIView.swift
//  nots
//
//  Created by Ivan Cantarino on 10/05/2020.
//  Copyright © 2020 Ivan Cantarino. All rights reserved.
//

import Foundation

extension UIView {
	
	/// Position the view within the `superview`
	/// - Parameters:
	///   - top: Top anchor to fix this view
	///   - left: Left anchor to fix this view
	///   - bottom: Bottom anchor to fix this view
	///   - right: Right anchor to fix this view
	///   - paddingTop: The distance (gap) on the top, relative to the top anchor
	///   - paddinfLeft: The distance (gap) on the left, relative to the top anchor
	///   - paddingBottom: The distance (gap) on the bottom, relative to the top anchor
	///   - paddingRight: The distance (gap) on the right, relative to the top anchor
	///   - width: View's `width`. Set only if one of the `Left` or `Right` anchors are `nil`
	///   - height: View's `height`: Set only if one of the `Top` or  `Bottom` anchors are `nil`
	public func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddinfLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {

		translatesAutoresizingMaskIntoConstraints = false
		if let top = top {
			topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
		}
		if let left = left {
			leftAnchor.constraint(equalTo: left, constant: paddinfLeft).isActive = true
		}
		if let bottom = bottom {
			bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
		}
		if let right = right {
			rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
		}
		if width != 0 {
			widthAnchor.constraint(equalToConstant: width).isActive = true
		}
		if height != 0 {
			heightAnchor.constraint(equalToConstant: height).isActive = true
		}
	}
	
	
	/// Center the view within the superview X and Y axis
	/// - Parameter subview: The view which `this` view will be centered relative
	public func center(_ subview: UIView) {
		centerXAnchor.constraint(equalTo: subview.centerXAnchor).isActive = true
		centerYAnchor.constraint(equalTo: subview.centerYAnchor).isActive = true
	}
	
	public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
		let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		let mask = CAShapeLayer()
		mask.path = path.cgPath
		self.layer.mask = mask
	}
	
	public func fillSuperview() {
		self.anchor(top: superview?.topAnchor, left: superview?.leftAnchor, bottom: superview?.bottomAnchor, right: superview?.rightAnchor, paddingTop: 0, paddinfLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
	}
	
	public func addSubviews(_ views: UIView...) {
		views.forEach {addSubview($0)}
	}
	
	/// Adds an `UIBlufEffect` to the view
	public func addBlurEffect() {
		var blurEffect: UIBlurEffect!
		blurEffect = UIBlurEffect(style: .systemMaterialDark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = self.bounds
		blurEffectView.alpha = 0.9
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.addSubview(blurEffectView)
	}
	
	/// Removes the `UIVisualEffectView`, for example
	/// if the view has a `UIBlufEffect` it gets removed
	public func removeBlurEffect() {
		subviews.forEach {
			if $0 is UIVisualEffectView {
				$0.removeFromSuperview()
			}
		}
	}
}
