//
//  SoundManager.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 17/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation
import AVFoundation


class SoundManager: NSObject {
    
    static let sharedInstance = SoundManager()
    
    var audioPlayer = AVAudioPlayer()
    
    func playSound(soundName: SoundName) {
        
        #if TARGET_IPHONE_SIMULATOR
            
        #else
            let soundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("\(kAudioPath)/\(soundName)", ofType: "caf")!)
            
            do {
                
                audioPlayer = try AVAudioPlayer(contentsOfURL: soundURL)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                
            } catch { log(self, message: "No sound found for URL:\(soundURL)") }
            
        #endif
        
    }
    
}