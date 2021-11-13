//
//  UIApplicationExtension.swift
//  
//
//  Created by florian schweizer on 16.03.21.
//

import UIKit

extension UIApplication: UIGestureRecognizerDelegate {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
    
    @objc func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    static var currentScene: UIWindowScene? {
        get {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                return scene
            } else {
                return nil
            }
        }
    }
}
