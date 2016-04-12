//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rajhans Jadhao on 26/03/16.
//  Copyright © 2016 Rajhans Jadhao. All rights reserved.
//

import UIKit
import AVFoundation
class PlaySoundViewController: UIViewController{
    
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var darthvader: UIButton!
    @IBOutlet weak var chip: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    
    
    @IBAction func playsoundForButton(sender : UIButton){
        print("play sound button is pressed")
        
    }
    
    @IBAction func stopButton(sender : AnyObject){
        print("stop button pressed...")
    }
    var recorderAudio :NSURL!
    override func viewDidLoad() {
       
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

