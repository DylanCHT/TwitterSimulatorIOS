//
//  TexrAreaView.swift
//  Twitter
//
//  Created by Dylan  Tao on 3/17/23.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeHolder: String
    
    init(_ placeHolder: String, text: Binding<String>) {
        self.placeHolder = placeHolder
        self._text = text         // this is the way to initial a binding property
        UITextView.appearance().backgroundColor = .yellow
    }
    
//    @available(iOS 16.0, *)
    var body: some View {
        ZStack(alignment: .topLeading) {
//            if text.isEmpty {
//                Text(placeHolder)
////                    .foregroundColor(Color(.placeholderText))
//                    .foregroundColor(Color(.gray))
//                    .padding(.horizontal, 8)
//                    .padding(.vertical, 12)
//            }
//
//            TextEditor(text: $text)
//                .padding(4)
            // this is better way, if follow video, placeholder won't showup
            if #available(iOS 16.0, *) {
                HStack{
                    TextField(placeHolder, text: $text, axis: .vertical)
                    //                    .lineLimit(3...5)
                        .textFieldStyle(.plain)
                        .foregroundColor(text.isEmpty ? Color(.gray) : Color(.black))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                }
            }
        }
        .font(.body)
    }
}

//struct TexrAreaView_Previews: PreviewProvider {
//    static var previews: some View {
//        TexrAreaView()
//    }
//}
