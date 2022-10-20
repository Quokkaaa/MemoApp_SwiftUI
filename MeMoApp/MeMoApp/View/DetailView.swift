//
//  DetailView.swift
//  MeMoApp
//
//  Created by LIMGAUI on 2022/08/20.
//

import SwiftUI

struct DetailView: View {
  @ObservedObject var memo: Memo
  
  @EnvironmentObject var store: MemoStore
  
  @State private var showComposer = false
  
    var body: some View {
      VStack {
        ScrollView {
          VStack {
            HStack {
              Text(memo.content)
                .padding()
              
              Spacer(minLength: 0)
            }
            
            Text(memo.insertData, style: .date)
              .padding()
              .font(.footnote)
              .foregroundColor(.secondary)
          }
        }
      }
      .navigationTitle("메모 보기")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItemGroup(placement: .bottomBar) {
          Button {
            showComposer = true
          } label: {
            Image(systemName: "square.and.pencil")
          }
        }
      }
      .sheet(isPresented: $showComposer) {
        WriteView(memo: memo)
      }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
      DetailView(memo: Memo(content: "Quokka Hello"))
        .environmentObject(MemoStore())
    }
}
