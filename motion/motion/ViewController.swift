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
            manager.startDeviceMotionUpdates(using: .xArbitraryZVertical, to: OperationQueue.main, withHandler: { (motion, e) in
                if let error = e {
                    print("error:", error)
                    return
                }
                guard let motion = motion else { return }
                /*
                if motion.magneticField.accuracy == .uncalibrated {
                    print("uncalibrated")
                    return
                }
                if motion.magneticField.accuracy == .low {
                    print("need calibration low")
                    return
                }
                 */
                //print("motion:", motion.attitude.roll, motion.attitude.pitch, motion.attitude.yaw)
                //let quat = motion.attitude.quaternion
                //let roll = atan2(2*(quat.y*quat.w - quat.x*quat.z), 1 - 2*quat.y*quat.y - 2*quat.z*quat.z)
                //let pitch = atan2(2*(quat.x*quat.w + quat.y*quat.z), 1 - 2*quat.x*quat.x - 2*quat.z*quat.z)
                //let yaw = asin(2*quat.x*quat.y + 2*quat.w*quat.z)
                self.labelRoll.text = String(round(motion.attitude.roll * 180.0 / .pi))
                self.labelPitch.text = String(round(motion.attitude.pitch * 180.0 / .pi))
                self.labelYaw.text = String(round(motion.attitude.yaw * 180.0 / .pi))
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

