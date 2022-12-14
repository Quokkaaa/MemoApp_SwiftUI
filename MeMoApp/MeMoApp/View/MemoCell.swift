//
//  MemoCell.swift
//  MeMoApp
//
//  Created by LIMGAUI on 2022/08/20.
//

import SwiftUI

struct MemoCell: View {
  @ObservedObject var memo: Memo
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(memo.content)
        .font(.body)
        .lineLimit(1)
      
      Text(memo.insertData, style: .date)
        .font(.caption)
        .foregroundColor(.secondary)
    }
  }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
      MemoCell(memo: Memo(content: "Test"))
    }
}
