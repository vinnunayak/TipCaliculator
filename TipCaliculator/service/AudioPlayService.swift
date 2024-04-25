//
//  AudioPlayService.swift
//  TipCaliculator
//
//  Created by Vinod Nayak Banavath on 25/04/24.
//

import Foundation
import AVFoundation


protocol AudioPlayerService {
    func playSound()
}

final class DefaultAudioPlayer: AudioPlayerService {

    private var player: AVAudioPlayer?


    func playSound() {
        print("playSound called")
        let path = Bundle.main.path(forResource: "click", ofType: "m4a")!
        let url = URL(filePath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
