//
//  ImageSaver.swift
//  DrawMailer
//
//  Created by gccisadmin on 11/30/23.
//

import Foundation
import SwiftUI

class ImageSAver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSAvingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save Finished!")
    }
}
