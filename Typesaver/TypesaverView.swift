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
    
    override func hasConfigureSheet() -> Bool {
        return false
    }
    
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
    
    func setupWebView() {
        
        // layout
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(webView)
        
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[webView]-0-|", options: nil, metrics: nil, views: ["webView": webView])
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[webView]-0-|", options: nil, metrics: nil, views: ["webView": webView])
        
        self.addConstraints(horizontalConstraints)
        self.addConstraints(verticalConstraints)
        
        // content
        let url = NSURL(string: "http://broadcast.typesaver.net/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
}
