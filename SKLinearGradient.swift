//
//  SKLinearGradient.swift
//  SpriteKitGradient
//
//  Created by Joshua Deichmann on 1/6/17.
//  Copyright © 2017 Joshua Deichmann. All rights reserved.
//

import SpriteKit

public enum GradientDirection {
    case up
    case left
    case upLeft
    case upRight
}

/// SKLinearGradient is a SKSpriteNode directional linear gradient
public class SKLinearGradient: SKSpriteNode{
    private var _colorOne: CIColor
    var colorOne: UIColor{
        get{
            return UIColor(ciColor: _colorOne)
        }
        set{
            _colorOne = CIColor(color: newValue)
            updateGradient()
        }
    }
    private var _colorTwo: CIColor
    var colorTwo: UIColor{
        get{
            return UIColor(ciColor: _colorTwo)
        }
        set{
            _colorTwo = CIColor(color: newValue)
            updateGradient()
        }
    }
    
    private var _gradientDirection: GradientDirection = .up
    var gradientDirection: GradientDirection {
        get{
            return _gradientDirection
        }
        set{
            _gradientDirection = newValue
            updateGradient()
        }
    }
    
    /// Initializer
    ///
    /// - Parameters:
    ///   - size: size of gradient
    ///   - colorOne: primary color of gradient
    ///   - colorTwo: secondary color of gradient
    ///   - direction: direction for gradient to point
    init(size: CGSize, colorOne: UIColor, colorTwo: UIColor, direction: GradientDirection = .up){
        _gradientDirection = direction
        _colorOne = CIColor(color: colorOne)
        _colorTwo = CIColor(color: colorTwo)
        
        let context = CIContext(options: nil)
        let filter = CIFilter(name: "CILinearGradient")
        var startVector: CIVector
        var endVector: CIVector
        
        filter!.setDefaults()
        
        switch _gradientDirection {
        case .up:
            startVector = CIVector(x: size.width * 0.5, y: 0)
            endVector = CIVector(x: size.width * 0.5, y: size.height)
        case .left:
            startVector = CIVector(x: size.width, y: size.height * 0.5)
            endVector = CIVector(x: 0, y: size.height * 0.5)
        case .upLeft:
            startVector = CIVector(x: size.width, y: 0)
            endVector = CIVector(x: 0, y: size.height)
        case .upRight:
            startVector = CIVector(x: 0, y: 0)
            endVector = CIVector(x: size.width, y: size.height)
        }
        
        filter!.setValue(startVector, forKey: "inputPoint0")
        filter!.setValue(endVector, forKey: "inputPoint1")
        filter!.setValue(_colorOne, forKey: "inputColor0")
        filter!.setValue(_colorTwo, forKey: "inputColor1")
        
        let image = context.createCGImage(filter!.outputImage!, from: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let texture = SKTexture(cgImage: image!)
        super.init(texture: texture, color: .white, size: size)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// updates the gradient when attributes have been changed
    private func updateGradient(){
        let context = CIContext(options: nil)
        let filter = CIFilter(name: "CILinearGradient")
        var startVector: CIVector
        var endVector: CIVector
        
        filter!.setDefaults()
        
        switch _gradientDirection {
        case .up:
            startVector = CIVector(x: size.width * 0.5, y: 0)
            endVector = CIVector(x: size.width * 0.5, y: size.height)
        case .left:
            startVector = CIVector(x: size.width, y: size.height * 0.5)
            endVector = CIVector(x: 0, y: size.height * 0.5)
        case .upLeft:
            startVector = CIVector(x: size.width, y: 0)
            endVector = CIVector(x: 0, y: size.height)
        case .upRight:
            startVector = CIVector(x: 0, y: 0)
            endVector = CIVector(x: size.width, y: size.height)
        }
        
        filter!.setValue(startVector, forKey: "inputPoint0")
        filter!.setValue(endVector, forKey: "inputPoint1")
        filter!.setValue(_colorOne, forKey: "inputColor0")
        filter!.setValue(_colorTwo, forKey: "inputColor1")
        
        let image = context.createCGImage(filter!.outputImage!, from: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let texture = SKTexture(cgImage: image!)
        self.texture = texture
        
    }
}

