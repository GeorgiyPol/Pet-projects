//
//  NotificationBadgeView.swift
//  animate-shaking-bell-iOSApp
//
//  Created by Georgiy on 07.10.2022.
//

import Foundation
import UIKit

class NotificationBadgeView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet var imageView: UIImageView!
    
    //продолжительность
    var duration: Double = 1 {
        didSet { shakeWith(duration: duration, angle: angle, yOffset: yOffset) }
    }
    
    //угол
    var angle: CGFloat = .pi/8 {
        didSet { shakeWith(duration: duration, angle: angle, yOffset: yOffset) }
    }

    //смещение
    var yOffset: CGFloat = 0.5 {
        didSet { shakeWith(duration: duration, angle: angle, yOffset: yOffset) }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle(for: NotificationBadgeView.self)
        bundle.loadNibNamed(String(describing: NotificationBadgeView.self), owner: self, options: nil)
        addSubview(contentView)
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 128, height: 128)
    }
}

extension NotificationBadgeView {
    
    private func shakeWith(duration: Double, angle: CGFloat, yOffset: CGFloat) {

        let numberOfFrames: Double = 6
        let frameDuration = Double(1/numberOfFrames)

        imageView.setAnchorPoint(CGPoint(x: 0.5, y: yOffset))

        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [],
          animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration,
                               relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: +angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*2,
                               relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*3,
                               relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: +angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*4,
                               relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*5,
                               relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform.identity
            }
          },
          completion: nil
        )
    }
}

extension UIView {
    
    func setAnchorPoint(_ point: CGPoint) {
        
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);

        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)

        var position = layer.position

        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        layer.position = position
        layer.anchorPoint = point
    }
}
