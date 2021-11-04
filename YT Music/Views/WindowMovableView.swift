//
//  WindowMovableView.swift
//  YT Music
//
//  Created by Stephen Radford on 01/07/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Cocoa
import WebKit

class WindowMovableView: NSView {
    
    weak var webview: WKWebView?
    
    override var mouseDownCanMoveWindow: Bool {
        return true
    }
    
    override var isOpaque: Bool {
        return false
    }
    
    override func acceptsFirstMouse(for event: NSEvent?) -> Bool {
        return true
    }
    
    override func mouseDragged(with event: NSEvent) {
        window?.performDrag(with: event)
    }
    
    override func mouseUp(with event: NSEvent) {
        guard let window = window else {
            return
        }
        
        guard event.clickCount == 2 else {
            guard event.clickCount == 1 else {
                return
            }
            // pass over event to parent
            webview?.mouseUp(with: event)
            return
        }
        
        window.setIsZoomed(!window.isZoomed)
    }
}
