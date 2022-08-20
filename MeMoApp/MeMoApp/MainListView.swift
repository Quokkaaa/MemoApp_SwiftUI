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
  
    var body: some View {
      NavigationView {
        List(store.list) { memo in
          VStack(alignment: .leading) {
            Text(memo.content)
              .font(.body)
              .lineLimit(1)
            
            Text(memo.insertData, style: .date)
              .font(.caption)
              .foregroundColor(.secondary)
          }
        }
        .listStyle(.plain)
        .navigationTitle("쿼카 메모")
      }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
        .environmentObject(MemoStore())
    }
}
