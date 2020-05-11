//
//  UITextView.swift
//  nots
//
//  Created by Ivan Cantarino on 10/05/2020.
//  Copyright © 2020 Ivan Cantarino. All rights reserved.
//

import Foundation


extension UITextView {

	/** Centers the text vertically,
		you know, as it says :)
	*/
    func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }

	/**	macOS (Catalyst)
		- faz com que não exista um border azul à volta do `UITextView` quando
		este é selecionado (está em destaque).
		- Torna o `_focusRingType` como `0` [NSFocusRingTypeNone].
	*/
	#if targetEnvironment(macCatalyst)
    @objc(_focusRingType)
    var focusRingType: UInt {
        return 1
    }
    #endif
}
