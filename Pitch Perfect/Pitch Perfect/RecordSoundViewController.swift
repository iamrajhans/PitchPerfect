//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Rajhans Jadhao on 22/03/16.
//  Copyright © 2016 Rajhans Jadhao. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate  {

    @IBOutlet weak var recordLabel: UILabel!
    
    @IBOutlet weak var recordAudio: UIButton!
    @IBOutlet weak var stopRecording: UIButton!
    
    var audioRecorder : AVAudioRecorder!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        stopRecording.enabled=false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: AnyObject) {
        print("record button pressed")
        recordLabel.text="Recording in progress"
        recordAudio.enabled=false
        stopRecording.enabled=true
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate=self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
//        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory,.UserDomainMask, true)[0] as String
//        let recordingName = "recordedVoice.wav"
//        let pathArray = [dirPath,recordingName]
//        let filePath = NSURL.fileURLWithPathComponents(pathArray)
//        print(filePath)
//        
//        
//        let session = AVAudioSession.sharedInstance()
//        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
//        
//        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
//        audioRecorder.meteringEnabled=true
//        audioRecorder.prepareToRecord()
//        audioRecorder.record()
        
        
    }

    @IBAction func stopRecording(sender: AnyObject) {
    
        recordLabel.text="Tap to Record"
        recordAudio.enabled=true
        stopRecording.enabled=false
        audioRecorder.stop()
        let audioSession=AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    override func viewWillAppear(animated: Bool) {

        print("will appear function called")
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Recording is finished")
        
        if(flag){
                self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
                print("file is saved...")
        }
        else{
            print("saving of recording failed")
            
        }
        
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier=="stopRecording"){
            let playSoundsVC=segue.destinationViewController as! PlaySoundViewController
            let audioRecoderURL = sender as! NSURL
            playSoundsVC.recorderAudio = audioRecoderURL
        }
    }
    
}

