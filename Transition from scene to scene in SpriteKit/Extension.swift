//
//  Extension.swift
//  Transition from scene to scene in SpriteKit
//
//  Created by Ilija Mihajlovic on 9/11/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//


import UIKit
import SpriteKit

enum UIUserInterfaceIdiom: Int {
    case undefined
    case phone
    case pad
    
}


struct ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}

struct DeviceType {
    static let isiPhone4OrLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength < 568
    
    static let isiPhone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let isiPhone6Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 812.0
    
    static let isiPad = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 1024.0
    static let isiPadPro = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 1366.0
    
}

//Creating an dinamic font size to adept to all screen sizes
public extension CGFloat {
    public static func universalFont(size: CGFloat) -> CGFloat {
        
        if DeviceType.isiPhone4OrLess {
            return size * 0.6
        }
        if DeviceType.isiPhone5 {
            return size * 0.8
        }
        if DeviceType.isiPhone6 {
            return size * 1.0
        }
        if DeviceType.isiPhone6Plus {
            return size * 1.0
        }
        if DeviceType.isiPhoneX {
            return size * 1.0
        }
        if DeviceType.isiPad {
            return size * 2.1
        }
        if DeviceType.isiPadPro {
            return size * 2.1
            
        } else {
            return size * 1.0
        }
    }
}


extension SKSpriteNode {
    
    func sclaleTo(screenWithPercentage: CGFloat) {
        let aspectRatio = self.size.height / self.size.width
        self.size.width = ScreenSize.width * screenWithPercentage
        self.size.height = self.size.width * aspectRatio
    }
    
    func scaleTo(screenHeightPercentage: CGFloat) {
        let aspectRatio = self.size.width / self.size.height
        self.size.height = ScreenSize.height * screenHeightPercentage
        self.size.width = self.size.height * aspectRatio
}
}



