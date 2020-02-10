 //
//  CircleButton.swift
//  Scribe
//
//  Created by mac on 2020/02/09.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
@IBDesignable
class CircleButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet {
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    func setupView(){
         layer.cornerRadius = cornerRadius
    }
}
