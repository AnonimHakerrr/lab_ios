//
//  ViewController.swift
//  lab3SB
//
//  Created by MacBook on 03.10.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

@IBDesignable
class GradientView: UIView {
    
    // MARK: - Inspectable properties
    @IBInspectable var startColor: UIColor = .blue {
        didSet { updateGradient() }
    }
    
    @IBInspectable var endColor: UIColor = .cyan {
        didSet { updateGradient() }
    }

    @IBInspectable var horizontal: Bool = false {
        didSet { updateGradient() }
    }

    @IBInspectable var diagonal: Bool = false {
        didSet { updateGradient() }
    }

    // MARK: - Override layer class
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    private var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }

    // MARK: - Update gradient
    private func updateGradient() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        
        var startPoint = CGPoint(x: 0, y: 0)
        var endPoint = CGPoint(x: 0, y: 1)

        if horizontal {
            startPoint = CGPoint(x: 0, y: 0.5)
            endPoint = CGPoint(x: 1, y: 0.5)
        }

        if diagonal {
            startPoint = CGPoint(x: 0, y: 0)
            endPoint = CGPoint(x: 1, y: 1)
        }

        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }

    // MARK: - Layout updates
    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradient()
    }
}

