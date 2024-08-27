//
//  OtpExtension.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 15/07/2024.
//

import Foundation
import UIKit
class SingleDigitField: UITextField {
    // create a boolean property to hold the deleteBackward info
    var pressedDelete = false
    // customize the text field as you wish
    override func willMove(toSuperview newSuperview: UIView?) {
        keyboardType = .numberPad
        textAlignment = .center
        backgroundColor = .white
        isSecureTextEntry = true
        isUserInteractionEnabled = false
    }
    // hide cursor
    override func caretRect(for position: UITextPosition) -> CGRect { .zero }
    // hide selection
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] { [] }
    // disable copy paste
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool { false }
    // override deleteBackward method, set the property value to true and send an action for editingChanged
    override func deleteBackward() {
        pressedDelete = true
        sendActions(for: .editingChanged)
    }
}
