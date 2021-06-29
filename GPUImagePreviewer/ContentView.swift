//
//  ContentView.swift
//  GPUImagePreviewer
//
//  Created by ted on 2021/6/29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: OptViewModel

    var body: some View {
        HStack {
            Image(nsImage: viewModel.destImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 1080, height: 720, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
                .border(Color.gray)
                .clipped()

            OptListPanel()
                .frame(width: 300, height: 720, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(OptViewModel())
    }
}
