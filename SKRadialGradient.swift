//
//  SKTextureGradient.swift
//	Linear gradient texture
//	Inspired by: https://gist.github.com/craiggrummitt/ad855e358004b5480960
//
//  Created by Maxim on 1/1/16.
//  Copyright © 2016 Maxim Bilan. All rights reserved.
//

import SpriteKit

public class SKRadialGradient: SKSpriteNode{
    private var _inputRadiusZero: CGFloat = 0.0
    var inputRadiusZero: CGFloat{
        get{
            return _inputRadiusZero
        }
        set{
            _inputRadiusZero = newValue
            updateGradient()
        }
    }
    private var _inputRadiusOne: CGFloat = 150.0
    var inputRadiusOne: CGFloat{
        get{
            return _inputRadiusOne
        }
        set{
            _inputRadiusOne = newValue
            updateGradient()
        }
    }
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
    
    private var _center: CGPoint
    var center: CGPoint{
        get{
            return _center
        }
        set{
            _center = newValue
            updateGradient()
        }
    }
    
    var image: CGImage!
    
    init(size: CGSize){
        self._colorOne = CIColor(color: .white)
        self._colorTwo = CIColor(color: .clear)
        let minDimention = min(size.width, size.height)
        self._inputRadiusOne = minDimention/2
        self._center = CGPoint(x: size.width/2, y: size.height/2)
        
        let context = CIContext(options: nil)
        let filter = CIFilter(name: "CIRadialGradient")
        filter?.setValue(_colorOne, forKey: "inputColor0")
        filter?.setValue(_colorTwo, forKey: "inputColor1")
        filter?.setValue(_inputRadiusZero, forKey: "inputRadius0")
        filter?.setValue(_inputRadiusOne, forKey: "inputRadius1")
        let vector = CIVector(cgPoint: _center)
        filter?.setValue(vector, forKey: "inputCenter")
        
        image = context.createCGImage(filter!.outputImage!, from: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let texture = SKTexture(cgImage: image!)
        
        super.init(texture: texture, color: .white, size: size)
    }
    
    init(size: CGSize, colorOne: UIColor, colorTwo: UIColor){
        self._colorOne = CIColor(color: colorOne)
        self._colorTwo = CIColor(color: colorTwo)
        let minDimention = min(size.width, size.height)
        self._inputRadiusOne = minDimention/2
        self._center = CGPoint(x: size.width/2, y: size.height/2)
        
        let context = CIContext(options: nil)
        let filter = CIFilter(name: "CIRadialGradient")
        filter?.setValue(_colorOne, forKey: "inputColor0")
        filter?.setValue(_colorTwo, forKey: "inputColor1")
        filter?.setValue(_inputRadiusZero, forKey: "inputRadius0")
        filter?.setValue(_inputRadiusOne, forKey: "inputRadius1")
        let vector = CIVector(cgPoint: _center)
        filter?.setValue(vector, forKey: "inputCenter")
        
        let image = context.createCGImage(filter!.outputImage!, from: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let texture = SKTexture(cgImage: image!)
        
        super.init(texture: texture, color: .white, size: size)
    }
    
    init(size: CGSize, colorOne: UIColor, colorTwo: UIColor, inputRadius: CGFloat, center: CGPoint) {
        self._colorOne = CIColor(color: colorOne)
        self._colorTwo = CIColor(color: colorTwo)
        self._inputRadiusOne = inputRadius
        self._center = center
        
        let context = CIContext(options: nil)
        let filter = CIFilter(name: "CIRadialGradient")
        filter?.setValue(_colorOne, forKey: "inputColor0")
        filter?.setValue(_colorTwo, forKey: "inputColor1")
        filter?.setValue(_inputRadiusZero, forKey: "inputRadius0")
        filter?.setValue(_inputRadiusOne, forKey: "inputRadius1")
        let vector = CIVector(cgPoint: _center)
        filter?.setValue(vector, forKey: "inputCenter")
        
        let image = context.createCGImage(filter!.outputImage!, from: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let texture = SKTexture(cgImage: image!)
        
        super.init(texture: texture, color: .white, size: size)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateGradient(){
        let context = CIContext(options: nil)
        let filter = CIFilter(name: "CIRadialGradient")
        filter?.setValue(_colorOne, forKey: "inputColor0")
        filter?.setValue(_colorTwo, forKey: "inputColor1")
        filter?.setValue(_inputRadiusZero, forKey: "inputRadius0")
        filter?.setValue(_inputRadiusOne, forKey: "inputRadius1")
        let vector = CIVector(cgPoint: _center)
        filter?.setValue(vector, forKey: "inputCenter")
        
        let image = context.createCGImage(filter!.outputImage!, from: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let texture = SKTexture(cgImage: image!)
        self.texture = texture
    }
    
}
