//
//  ViewController.swift
//  CYBAVOMsecExample
//
//  Created by Eva Hsu on 2020/4/13.
//  Copyright © 2020 Cybavo. All rights reserved.
//

import UIKit
import CYBAVOLibmsec
class ViewController: UIViewController {

    @IBOutlet weak var jailBroken: UILabel!
    @IBOutlet weak var emulator: UILabel!
    @IBOutlet weak var mockLocation: UILabel!
    var TITLE_JB = "Jail broken"
    var TITLE_EMULATOR = "Emulator"
    var TITLE_DEBUGGING = "Debugging mode"
    @IBAction func onClick(_ sender: Any) {
        resetDeviceSecurityState()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.fetchDeviceSecurityState()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDeviceSecurityState()
    }
    
    func resetDeviceSecurityState(){
        reset(label: jailBroken, text: TITLE_JB)
        reset(label: emulator, text: TITLE_EMULATOR)
        reset(label: mockLocation, text: TITLE_DEBUGGING)
    }
    
    func fetchDeviceSecurityState(){
        let state = DeviceSecurity.getSecurityState()
        showState(label: jailBroken, text: TITLE_JB, detected: state.isJailBroken)
        showState(label: emulator, text: TITLE_EMULATOR, detected: state.isEmulator)
        showState(label: mockLocation, text: TITLE_DEBUGGING, detected: state.isDebuggingEnabled)
    }
    
    func showState(label: UILabel, text: String, detected: Bool){
        label.text = "\(text): \(detected ? "DETECTED!" : "PASSED")"
        label.textColor = detected ? UIColor.red : UIColor.systemGreen
    }
    
    func reset(label: UILabel, text: String){
        label.text = "\(text): Undetermined"
        label.textColor = UIColor.gray
    }
}

