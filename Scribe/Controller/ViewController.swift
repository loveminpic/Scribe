//
//  ViewController.swift
//  Scribe
//
//  Created by mac on 2020/02/09.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var transcriptionTextField: UITextView!
    
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.isHidden = true
    }
        func requestSpeechAuth() {
            SFSpeechRecognizer.requestAuthorization {authStatus  in
                if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                    if let path = Bundle.main.url(forResource: "test", withExtension: "m4a"){
                        do {
                            let sound = try AVAudioPlayer(contentsOf: path)
                            self.audioPlayer = sound
                            sound.play()
                            
                        } catch {
                            print("ERROR!")
                        }
                        
                        let recognzier = SFSpeechRecognizer()
                        let request = SFSpeechURLRecognitionRequest(url: path)
                        recognzier?.recognitionTask(with: request) {(result,error) in
                            if let error = error {
                                print("There was an error: \(error)")
                            } else {
                                print(result?.bestTranscription.formattedString as Any)
                            }
                        }
                        
                    }
                    
                }
            }
        }
      
    @IBAction func playBtnpress(_ sender: Any) {
        
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        requestSpeechAuth()
    }
    
}

