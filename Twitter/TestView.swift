//
//  TestView.swift
//  Twitter
//
//  Created by Dylan  Tao on 8/17/22.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ScrollView{

            LazyVStack(alignment: .leading) {
                ForEach(0 ... 10, id: \.self) { index in
                    Text("\(index), qwertyuiopoiuytrert").font(.title2).lineSpacing(20)
                    
                    Spacer()
                }
                .padding()
//                .frame(height: 10)
            }
        }
    }
}

struct CView: View {
    var body: some View {
        ZStack(alignment: .bottom)  {

            VStack {
                TestView()
                    .padding(10)
                    .cornerRadius(30)
    //                .background(Color(.gray))
                    .shadow(color: Color.black.opacity(0.4), radius: 30, x: 5, y: 5)
                .frame(maxHeight: UIScreen.main.bounds.height*0.5)
                
                Spacer()

                HStack(alignment: .bottom){
                    Button(action: {}, label: {
                        Text("Done!")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding([.horizontal], 50)
                            .padding(20)
                            .background(Color(#colorLiteral(red: 0.9333333373069763, green: 0.9333333373069763, blue: 0.9333333373069763, alpha: 1)))
                            .cornerRadius(40)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.black, lineWidth: 5)
                                    
                            )
                    })
                }

            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        CView()
    }
}
