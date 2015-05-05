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



class TypesaverView: ScreenSaverView, WKNavigationDelegate {

    let webView: WKWebView
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(frame: CGRectZero, isPreview: false)
    }
    
    override init(frame: NSRect, isPreview: Bool) {
        webView = WKWebView()
        super.init(frame: frame, isPreview: isPreview)
        setupWebView()
    }
    
    required init?(coder: NSCoder) {
        webView = WKWebView()
        super.init(coder: coder)
        setupWebView()
    }
    

    
    // MARK: - ScreenSaverView
    
    override func hasConfigureSheet() -> Bool {
        return false
    }

    
    
    
    // MARK: - NSView overrides, responder behavior

    // Idea from https://github.com/liquidx/webviewscreensaver
    
    override func hitTest(aPoint: NSPoint) -> NSView? {
        return self
    }
    
    override func keyDown(theEvent: NSEvent) {
        return
    }
    
    override func keyUp(theEvent: NSEvent) {
        return
    }

    override var acceptsFirstResponder: Bool {
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        return false
    }
    
    
    
    // MARK: - WKNavigationDelegate
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        // Don’t be first responder and capture any events, so that moving the mouse can abort the screensaver
        webView.resignFirstResponder()
    }
    
    
    
    // MARK: - Custom UI, behavior
    
    func setupWebView() {
        
        // layout
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(webView)
        
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[webView]-0-|", options: nil, metrics: nil, views: ["webView": webView])
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[webView]-0-|", options: nil, metrics: nil, views: ["webView": webView])
        
        self.addConstraints(horizontalConstraints)
        self.addConstraints(verticalConstraints)
        
        // content
        webView.navigationDelegate = self
        let url = NSURL(string: "http://broadcast.typesaver.net/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
}
