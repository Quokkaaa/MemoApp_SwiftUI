//
//  ComposeView.swift
//  MeMoApp
//
//  Created by LIMGAUI on 2022/08/20.
//

import SwiftUI

struct WriteView: View {
  @EnvironmentObject var store: MemoStore
  
  var memo: Memo? = nil // memo가 전달되면 읽기, 아니면 쓰기모드
  
  @Environment(\.dismiss) var dismiss
  
  @State private var content: String = ""
  
    var body: some View {
      NavigationView {
        VStack {
          TextEditor(text: $content) // content속성과 textEditor가 자동으로 저장되고 반대로 content속성에 문자열을 저장하면 textEditor에도 동일한 문자열이 표시됩니다. 이러한걸 투에이 바인딩이라고 하는데 스유에서는 간단히 구현해볼 수 있다.
            .padding()
            .onAppear {
              if let memo = memo {
                content = memo.content
              }
            }
        }
        .navigationTitle(memo != nil ? "메모편집" : "새 메모")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItemGroup(placement: .navigationBarLeading) {
            Button {
              dismiss()
            } label: {
              Text("취소")
            }
          }
          
          ToolbarItemGroup(placement: .navigationBarTrailing) {
            Button {
              if let memo = memo {
                store.update(memo: memo, content: content)              } else {
                store.insert(memo: content)
              }
              
              dismiss()
            } label: {
              Text("저장")
            }
          }
        }
      }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
        .environmentObject(MemoStore())
    }
}
