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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if manager.isDeviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.5 // default is 0.1
            manager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: { (motion, error) in
                guard let motion = motion else { return }
                let gravity = motion.gravity
                let gs = gravity.x * gravity.x + gravity.y * gravity.y + gravity.z * gravity.z
                let user = motion.userAcceleration
                let us = user.x * user.x + user.y * user.y + user.z * user.z
                print("gs/us:", gs, us)
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

