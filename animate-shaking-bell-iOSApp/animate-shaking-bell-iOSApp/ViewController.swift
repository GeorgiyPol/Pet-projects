//
//  ViewController.swift
//  animate-shaking-bell-iOSApp
//
//  Created by Georgiy on 07.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bellView: NotificationBadgeView!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var angleSlider: UISlider!
    @IBOutlet weak var offsetSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func durationChanged(_ sender: UISlider) {
        bellView.duration = Double(sender.value)*2
    }
    
    @IBAction func angleChanged(_ sender: UISlider) {
        let normalized = CGFloat(sender.value) * .pi/2
        bellView.angle = normalized
    }
    
    @IBAction func offsetChanged(_ sender: UISlider) {
        bellView.yOffset = CGFloat(sender.value)
    }
    
    @IBAction func reset(_ sender: Any) {
        durationSlider.value = 0.5
        angleSlider.value = 0.5
        offsetSlider.value = 0.5

        bellView.duration = Double(1)
        bellView.angle = .pi/8
        bellView.yOffset = 0.5
    }
}
