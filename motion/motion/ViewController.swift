//
//  ViewController.swift
//  motion
//
//  Created by SATOSHI NAKAJIMA on 9/6/17.
//  Copyright © 2017 SATOSHI NAKAJIMA. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let manager = CMMotionManager()
    @IBOutlet var labelRoll:UILabel!
    @IBOutlet var labelPitch:UILabel!
    @IBOutlet var labelYaw:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if manager.isDeviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.1 // default is 0.1
            manager.showsDeviceMovementDisplay = true
            manager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: OperationQueue.main, withHandler: { (motion, error) in
                guard let motion = motion else { return }
                //print("motion:", motion.attitude.roll, motion.attitude.pitch, motion.attitude.yaw)
                self.labelRoll.text = String(round(motion.attitude.roll * 360.0))
                self.labelPitch.text = String(round(motion.attitude.pitch * 360.0))
                self.labelYaw.text = String(round(motion.attitude.yaw * 360.0))
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

