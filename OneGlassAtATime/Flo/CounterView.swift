/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

@IBDesignable class CounterView: UIView {
  
  private struct Constants {
    static let numberOfGlasses = 8
    static let lineWidth: CGFloat = 5.0
    static let arcWidth: CGFloat = 76
    
    static var halfOfLineWidth: CGFloat {
      return lineWidth / 2
    }
  }
  
  @IBInspectable var counter: Int = 5 {
    didSet {
      if counter <=  Constants.numberOfGlasses {
        //the view needs to be refreshed
        setNeedsDisplay()
      }
    }
  }
  @IBInspectable var outlineColor: UIColor = UIColor.blue
  @IBInspectable var counterColor: UIColor = UIColor.orange
  
  override func draw(_ rect: CGRect) {
    // 1
    let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
    
    // 2
    let radius: CGFloat = max(bounds.width, bounds.height)
    
    // 3
    let startAngle: CGFloat = 3 * .pi / 4
    let endAngle: CGFloat = .pi / 4
    
    // 4
    let path = UIBezierPath(arcCenter: center,
                            radius: radius/2 - Constants.arcWidth/2,
                            startAngle: startAngle,
                            endAngle: endAngle,
                            clockwise: true)
    
    // 5
    path.lineWidth = Constants.arcWidth
    counterColor.setStroke()
    path.stroke()
    
    
    //Draw the outline
    
    //1 - first calculate the difference between the two angles
    //ensuring it is positive
    let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
    //then calculate the arc for each single glass
    let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
    //then multiply out by the actual glasses drunk
    let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
    
    //2 - draw the outer arc
    let outlinePath = UIBezierPath(arcCenter: center,
                                   radius: bounds.width/2 - Constants.halfOfLineWidth,
                                   startAngle: startAngle,
                                   endAngle: outlineEndAngle,
                                   clockwise: true)
    
    //3 - draw the inner arc
    outlinePath.addArc(withCenter: center,
                       radius: bounds.width/2 - Constants.arcWidth + Constants.halfOfLineWidth,
                       startAngle: outlineEndAngle,
                       endAngle: startAngle,
                       clockwise: false)
    
    //4 - close the path
    outlinePath.close()
    
    outlineColor.setStroke()
    outlinePath.lineWidth = Constants.lineWidth
    outlinePath.stroke()
    
    //Counter View markers
    let context = UIGraphicsGetCurrentContext()
    
    //1 - save original state
    context?.saveGState()
    outlineColor.setFill()
    
    let markerWidth: CGFloat = 5.0
    let markerSize: CGFloat = 10.0
    
    //2 - the marker rectangle positioned at the top left
    let markerPath = UIBezierPath(rect: CGRect(x: -markerWidth/2, y: 0, width: markerWidth, height: markerSize))
    
    //3 - move top left of context to the previous center position
    context?.translateBy(x: rect.width/2, y: rect.height/2)
    
    for i in 1...Constants.numberOfGlasses {
      //4 - save the centred context
      context?.saveGState()
      //5 - calculate the rotation angle
      let angle = arcLengthPerGlass * CGFloat(i) + startAngle - .pi/2
      //rotate and translate
      context?.rotate(by: angle)
      context?.translateBy(x: 0, y: rect.height/2 - markerSize)
      
      //6 - fill the marker rectangle
      markerPath.fill()
      //7 - restore the centred context for the next rotate
      context?.restoreGState()
    }
    
    //8 - restore the original state in case of more painting
    context?.restoreGState()
  }
}
