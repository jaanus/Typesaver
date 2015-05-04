//
//  TypesaverView.swift
//  Typesaver
//
//  Created by Jaanus Kase on 04/05/15.
//  Copyright (c) 2015 Typesaver. All rights reserved.
//

import Cocoa
import ScreenSaver
import WebKit



class TypesaverView: ScreenSaverView {

    let webView: WKWebView
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        NSColor.redColor().setFill()
        NSRectFill(NSMakeRect(100, 100, 100, 200))
        
        // Drawing code here.
    }
    
    override func hasConfigureSheet() -> Bool {
        return false
    }
    
    override init!(frame: NSRect, isPreview: Bool) {
        webView = WKWebView()
        super.init(frame: frame, isPreview: isPreview)
        setupWebView()
    }
    
    required init?(coder: NSCoder) {
        webView = WKWebView()
        super.init(coder: coder)
        setupWebView()
    }
    
    func setupWebView() {
        
    }
    
//    override func viewWillMoveToWindow(newWindow: NSWindow?) {
//        super.viewWillMoveToWindow(newWindow)
//    }
    
}
