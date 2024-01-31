//
//  OpusHelper.swift
//  audioEngine
//
//  Created by Abdulla on 30.01.2024.
//

import Foundation
import Opus
import Copus
import AVFoundation

protocol OpusHelperType {
    func encode()
}

class OpusHelper {
    var outputData: Data
    let opusEncoder: Opus.Encoder
    
    init(outputData: Data = Data(), recordingFormat: AVAudioFormat) {
        self.outputData = outputData
        self.opusEncoder = try! Opus.Encoder(format: recordingFormat)
    }
    
    func encode(_ buffer: AVAudioPCMBuffer, recordingFormat: AVAudioFormat) -> Data? {
        do {
            let result = try opusEncoder.encode(buffer, to: &outputData)
            print("SSS result \(result)")
            return outputData
        } catch let error {
            debugPrint("SSS \(error)")
            return nil
        }
    }
}
