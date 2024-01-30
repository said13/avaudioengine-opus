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

    init(outputData: Data = Data()) {
        self.outputData = outputData
    }
    
    func encode(_ buffer: AVAudioPCMBuffer, recordingFormat: AVAudioFormat, completion: ((Result<Data, Error>) -> Void)?) {
        do {
            let opusEncoder = try Opus.Encoder(format: recordingFormat, application: .audio)
            let result = try opusEncoder.encode(buffer, to: &outputData)
            try opusEncoder.reset()
            print("SSS result \(result)")
            completion?(.success(outputData))
        } catch let error {
            debugPrint("SSS \(error)")
            completion?(.failure(error))
        }
    }
}
