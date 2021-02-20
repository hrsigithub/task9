//
//  ContentView.swift
//  task9
//
//  Created by Hiroshi.Nakai on 2021/02/20.
//

import SwiftUI

struct ContentView: View {

    @State private var isShowModal = false
    @State private var prefName = "未選択"

    var body: some View {
        VStack {
            HStack {
                Text("都道府県").font(.title3).padding()
                Text(prefName).font(.title3).padding()
                Button("入力") {
                    self.isShowModal.toggle()

                }.sheet(isPresented: $isShowModal
                ) {
                    PrefecturesView(isShowModal: $isShowModal, selectPref: $prefName)
                }
            }
            Spacer()
        }
    }
}

struct PrefecturesView: View {

    @State private var PrefData =
        ["東京都", "神奈川県", "埼玉県", "千葉県"]

    @Binding var isShowModal: Bool
    @Binding var selectPref: String

    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    self.isShowModal.toggle()
                }
                Spacer()
            }.padding()

            VStack {
                List {
                    ForEach(PrefData, id: \.self) { data in
                        Button("\(data)") {
                            self.selectPref = data
                            self.isShowModal.toggle()
                        }
                    }
                }
            }
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {

    @State static var isShowModal = false
    static var previews: some View {
//        PrefecturesView(isShowModal: $isShowModal)
        ContentView()
    }
}
