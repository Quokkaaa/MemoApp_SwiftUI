//
//  Memo.swift
//  MeMoApp
//
//  Created by LIMGAUI on 2022/08/19.
//

import Foundation
import SwiftUI
// dataList를 쉽게 바인딩하기위해 / 데이터를 자동으로 업데이트하기위해
class Memo: Identifiable, ObservableObject {
  let id: UUID
  @Published var content: String //새로운 값을 추가할때마다 자동으로 업데이트 된다.
  let insertData: Data
  
  init(content: String, insertData: Data = Data.init()) {
    id = UUID()
    self.content = content
    self.insertData = insertData
  }
}
