//
//  utilities.swift
//  NF
//
//  Created by Anush Tadevosyan on 1/8/22.
//

import UIKit

let defaults = UserDefaults.standard

extension UIView {

    //MARK: -USAGE OF GRADIENT FUNCTIONS
    //usage:
//    self.btn.applyGradient(colours: [.yellow, .blue])
//    self.view.applyGradient(colours: [.yellow, .blue, .red], locations: [0.0, 0.5, 1.0])
//
    
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }


    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

extension UIButton{

        func addTextSpacing(_ letterSpacing: CGFloat){
            let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
            self.setAttributedTitle(attributedString, for: .normal)
        }
    
  
        func applyGradient(colors: [CGColor]) {
            self.backgroundColor = nil
            self.layoutIfNeeded()
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = colors
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.95)
            gradientLayer.endPoint = CGPoint(x: 0.85, y: 1)
            
            
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = self.frame.height/2

            //gradientLayer.shadowColor = UIColor.darkGray.cgColor
           // gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
            //gradientLayer.shadowRadius = 5.0
            //gradientLayer.shadowOpacity = 0.3
            gradientLayer.masksToBounds = false

            self.layer.insertSublayer(gradientLayer, at: 0)
            self.contentVerticalAlignment = .center
            self.setTitleColor(UIColor.white, for: .normal)
            //self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
            self.titleLabel?.textColor = UIColor.white
        }
    


 }


extension UILabel {
  func addCharacterSpacing(kernValue: Double) {
    if let labelText = text, labelText.count > 0 {
      let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
      attributedText = attributedString
    }
  }
}




extension CAGradientLayer {

    func backgroundGradientColor() -> CAGradientLayer {
        let topColor = UIColor(red: (0/255.0), green: (153/255.0), blue:(51/255.0), alpha: 1)
        let bottomColor = UIColor(red: (0/255.0), green: (153/255.0), blue:(255/255.0), alpha: 1)

        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        

        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPoint(x:0.0, y:0.85)
        gradientLayer.endPoint = CGPoint(x: 1.0, y:0.05)

        return gradientLayer

    }
}
