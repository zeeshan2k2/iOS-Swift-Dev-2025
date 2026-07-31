//
//  PracticeView.swift
//  CoreGraphics 20
//
//  Created by Zeeshan Waheed on 31/07/2026.
//

import UIKit

@IBDesignable
class PracticeView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // gets context necessary such that we can start drawing
        // holds the state of all drawing in our core graphics application
        
        /*
        let context = UIGraphicsGetCurrentContext()
        
        // fill color - global context fill color
        context?.setFillColor(UIColor.orange.cgColor)
        
        context?.setStrokeColor(UIColor.blue.cgColor)
        
        context?.setLineWidth(6.5)
        
        // defining paths - creating an orange rectangle
        /*
        context?.move(to: CGPoint(x: 0, y: 0))
        
        context?.addLine(to: CGPoint(x: 180, y: 0))
        
        context?.addLine(to: CGPoint(x: 180, y: 90))
        
        context?.addLine(to: CGPoint(x: 0, y: 90))
        
        context?.closePath()
        
        context?.fillPath()
        */
        
        
        
        /*
        let recPath = CGMutablePath()
        
        recPath.move(to: CGPoint(x: 2.25, y: 2.25))
        
        recPath.addLine(to: CGPoint(x: 180.25, y: 2.25))
        
        recPath.addLine(to: CGPoint(x: 180.25, y: 90.25))
        
        recPath.addLine(to: CGPoint(x: 2.25, y: 90.25))
        
        recPath.closeSubpath()
        
        context?.addPath(recPath)
        
//        context?.fillPath()
        context?.strokePath()
         */
        
        
        // Bezier Path is an abstraciton over the CGMutablePath
        /*
        let recPath = UIBezierPath()
        
        recPath.move(to: CGPoint(x: 2.25, y: 2.25))
        
        recPath.addLine(to: CGPoint(x: 180.25, y: 2.25))
        
        recPath.addLine(to: CGPoint(x: 180.25, y: 90.25))
        
        recPath.addLine(to: CGPoint(x: 2.25, y: 90.25))
        
        recPath.fill()
        */
        
        UIColor.green.setFill()
        
        
        // the UIColor.blue.setFill() in the createTraingle function changes the context color so rectangle is rendered in a blue color
        createTriangle()
        
        let rectPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 180, height: 90))
        
        rectPath.fill()

        
        // from top to bottom each drawing is rendered from top to bottom so this triangle is gonna appear above the rectangle
        
//        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 180, height: 90))
//        
//        UIColor.green.setFill()
//        
//        ovalPath.fill()
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        let startAngleInDegrees: CGFloat = 135 * CGFloat(Double.pi) / 180
        
        let endAngleInDegrees: CGFloat = 45 * CGFloat(Double.pi) / 180
        
        let arcRadius: CGFloat = bounds.width / 2
        
        let arcPath = UIBezierPath(arcCenter: center, radius: arcRadius - 25, startAngle: startAngleInDegrees, endAngle: endAngleInDegrees, clockwise: true)
        
        arcPath.lineWidth = 50
        
        UIColor.red.setStroke()
        
        UIColor.orange.setStroke()
        
        arcPath.stroke()
        
        */
        
        /*
        
        // creating a gradient
        let context = UIGraphicsGetCurrentContext()!
        
        context.saveGState()
        
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 200, height: 200))
        
        ovalPath.addClip()
 

        let gradientStartColor = UIColor.yellow.cgColor
        let gradientEndColor = UIColor.red.cgColor

        let colors = [
            gradientStartColor,
            gradientEndColor
        ]

        let colorLocations: [CGFloat] = [0.0, 1.0]

        let colorSpace = CGColorSpaceCreateDeviceRGB()

        let gradient = CGGradient(
            colorsSpace: colorSpace,
            colors: colors as CFArray,
            locations: colorLocations
        )!

        let startPoint = CGPoint.zero

        let endPoint = CGPoint(
            x: 0.0,
            y: bounds.height
        )

        context.drawLinearGradient(
            gradient,
            start: startPoint,
            end: endPoint,
            options: []
        )
        
        context.restoreGState()
        
        let secondOval = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        
        UIColor.green.setFill()
        
        secondOval.fill()
        
        */
        
        
        
        /*
        // Shadows
        let context = UIGraphicsGetCurrentContext()!

        let shadowColor =
            UIColor.black.withAlphaComponent(0.7).cgColor

        let shadowOffset = CGSize(
            width: 2.0,
            height: 2.0
        )

        let shadowBlurRadius: CGFloat = 5.0

        context.setShadow(
            offset: shadowOffset,
            blur: shadowBlurRadius,
            color: shadowColor
        )

        let oval = UIBezierPath(
            ovalIn: CGRect(
                x: 50,
                y: 50,
                width: 100,
                height: 100
            )
        )

        UIColor.green.setFill()

        oval.fill()
         
        */
        
        
    }
    
    func createTriangle() {
        let trianglePath = UIBezierPath()
        
        trianglePath.move(to: CGPoint(x: 2, y: 90))
        
        trianglePath.addLine(to: CGPoint(x: 100, y: 90))
        
        trianglePath.addLine(to: CGPoint(x: 50, y: 10))
        
        trianglePath.close()
        
        UIColor.blue.setFill()
        
        trianglePath.fill()
    }

}
