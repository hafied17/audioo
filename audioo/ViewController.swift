//
//  ViewController.swift
//  audioo
//
//  Created by hafied Khalifatul ash.shiddiqi on 29/10/20.
//  Copyright © 2020 hafied. All rights reserved.
//

import UIKit
import InstantSearchVoiceOverlay

class ViewController: UIViewController, VoiceOverlayDelegate {

    let voiceOverlay = VoiceOverlayController()
    @IBOutlet var myButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.backgroundColor = .systemRed
        myButton.setTitleColor(.white, for: .normal)
    }
    @IBAction func didTapButton(){
        voiceOverlay.delegate = self
        voiceOverlay.settings.autoStart = false
        voiceOverlay.settings.autoStop = true
        voiceOverlay.settings.autoStopTimeout = 10
    
        
        voiceOverlay.start(on: self, textHandler: { text, final, _ in
            
            if final {
                print("Final text: \(text)")
            }else{
                print("In progress: \(text)")
            }
            
        }, errorHandler: { error in
            
        })
    }
    func recording(text: String?, final: Bool?, error: Error?){
        
    }
}

