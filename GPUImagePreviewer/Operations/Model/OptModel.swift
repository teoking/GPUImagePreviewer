//
//  OptModel.swift
//  GPUImagePreviewer
//
//  Created by ted on 2021/6/28.
//

import Foundation
import GPUImage

struct OptModel {
    var id: Int
    var name: String
    var filter: FilterType
    var isOptOn: Bool = false
}

enum FilterType {
    case SmoothToon
    case BoxBlur
    case WhiteBalance
    case HueAdjustment
}
