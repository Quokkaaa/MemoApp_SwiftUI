//
//  MainListView.swift
//  MeMoApp
//
//  Created by LIMGAUI on 2022/08/19.
//

import SwiftUI

struct MainListView: View {
  @EnvironmentObject var store: MemoStore
  // 하나의 데이터를 여러뷰에 공유하고싶을때 이런식으로 사용한다 ?
  @State private var showComposer: Bool = false
  
    var body: some View {
      NavigationView {
        List(store.list) { memo in
          NavigationLink {
            DetailView(memo: memo)
          } label: {
            MemoCell(memo: memo)
          }
        }
        .listStyle(.plain)
        .navigationTitle("쿼카 메모")
        .toolbar {
          Button {
            showComposer = true
          } label: {
            Image(systemName: "plus")
          }
        }
        .sheet(isPresented: $showComposer) {
          WriteView()
        }
      }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
        .environmentObject(MemoStore())
    }
}
