//
//  OptViewModel.swift
//  GPUImagePreviewer
//
//  Created by ted on 2021/6/28.
//

import Cocoa
import Foundation
import GPUImage
import SwiftUI

final class OptViewModel: ObservableObject {
    var optData: [OptModel] = [
        OptModel(id: 0, name: "SmoothToonFilter", filter: FilterType.SmoothToon),
        OptModel(id: 1, name: "BoxBlur", filter: FilterType.BoxBlur),
        OptModel(id: 2, name: "WhiteBalance", filter: FilterType.WhiteBalance),
        OptModel(id: 3, name: "HueAdjustment", filter: FilterType.HueAdjustment),
    ]

    let srcImage: NSImage = NSImage(named: NSImage.Name("testimage"))!
    @Published var destImage: NSImage = NSImage(named: NSImage.Name("testimage"))!

    func applyFilters(id: Int, isOptOn: Bool) {
        optData[id].isOptOn = isOptOn

        let pictureInput = PictureInput(image: srcImage)
        let pictureOutput = PictureOutput()
        var result = srcImage

        pictureOutput.imageAvailableCallback = { image in
            // Update the out image to result
            result = image
        }

        // Apply filters in turn
        var lastOptFilter: ImageSource = pictureInput
        for opt in optData {
            if opt.isOptOn {
                switch opt.filter {
                case FilterType.SmoothToon:
                    lastOptFilter = lastOptFilter --> SmoothToonFilter()
                case FilterType.BoxBlur:
                    lastOptFilter = lastOptFilter --> BoxBlur()
                case FilterType.WhiteBalance:
                    let wb = WhiteBalance()
                    wb.temperature = 1000
                    lastOptFilter = lastOptFilter --> wb
                case FilterType.HueAdjustment:
                    lastOptFilter = lastOptFilter --> HueAdjustment()
                }
            }
        }
        lastOptFilter --> pictureOutput

        pictureInput.processImage(synchronously: true)

        destImage = result
    }
}
