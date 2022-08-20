//
//  MemoStore.swift
//  MeMoApp
//
//  Created by LIMGAUI on 2022/08/19.
//

import Foundation

class MemoStore: ObservableObject {
  @Published var list: [Memo] // 배열을 업데이트할때마다 등록되있는 list값이 자동으로 업데이트된다.
  
  init() {
    list = [
      Memo(content: "쿼카", insertData: Date.now),
      Memo(content: "토끼", insertData: Date.now.addingTimeInterval(3600 * -24)),
      Memo(content: "거북이", insertData: Date.now.addingTimeInterval(3600 * -48))
    ]
  }
  
  func insert(memo: String) {
    list.insert(Memo(content: memo), at: 0)
  }
  
  func update(memo: Memo?, content: String) {
    guard let memo = memo else {
      return
    }
    memo.content = content
  }
  
  func delete(memo: Memo) {
    list.removeAll {
      $0.id == memo.id
    }
  }
  
  func delete(set: IndexSet) {
    for index in set {
      list.remove(at: index)
    }
  }
}
