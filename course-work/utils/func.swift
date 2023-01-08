import UIKit

func addGradientBg(self:UIViewController){
    self.view.backgroundColor = kBackgroundColor1
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [kBackgroundColor1.cgColor, kBackgroundColor2.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    gradientLayer.frame = self.view.bounds
    self.view.layer.insertSublayer(gradientLayer, at: 0)
}
