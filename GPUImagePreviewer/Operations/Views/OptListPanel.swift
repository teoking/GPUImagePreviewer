//
//  OptListPanel.swift
//  GPUImagePreviewer
//
//  Created by ted on 2021/6/28.
//

import SwiftUI

struct OptListPanel: View {
    @EnvironmentObject var viewModel: OptViewModel

    var body: some View {
        VStack {
            Text("Filter Operations")
                .font(.title)
                .bold()
                .padding()

            Divider()

            List(viewModel.optData, id: \.id) { data in
                OptBaseView(optModel: data)
            }
        }
        .background(Color.white)
    }
}

struct OptListPanel_Previews: PreviewProvider {
    static var previews: some View {
        OptListPanel().environmentObject(OptViewModel())
    }
}
