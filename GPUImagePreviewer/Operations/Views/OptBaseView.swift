//
//  OptBaseView.swift
//  GPUImagePreviewer
//
//  Created by ted on 2021/6/28.
//

import SwiftUI

struct OptBaseView: View {
    @EnvironmentObject var viewModel: OptViewModel
    @State private var optOn = false

    var optModel: OptModel

    init(optModel: OptModel) {
        self.optModel = optModel
        optOn = optModel.isOptOn
    }

    var body: some View {
        HStack {
            Toggle(isOn: $optOn, label: {
                Text(optModel.name)
            })
                .onChange(of: $optOn.wrappedValue, perform: { value in
                    viewModel.applyFilters(id: optModel.id, isOptOn: value)
                })
                .toggleStyle(SwitchToggleStyle())
        }
    }
}

struct OptBaseView_Previews: PreviewProvider {
    static let viewModel = OptViewModel()

    static var previews: some View {
        Group {
            OptBaseView(optModel: viewModel.optData[0])
                .environmentObject(viewModel)
        }
    }
}
