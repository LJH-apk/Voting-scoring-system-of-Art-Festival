//
//  ContentView.swift
//  Voting scoring system of Art Festival
//
//  Created by 刘佳航 on 2021/2/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack(alignment: .center) {
            ZStack(alignment:.bottom) {
                NavigationView {
                    VStack {
                        NavigationLink(
                            destination: Second(),
                            label: {
                                Text("进入评分")
                                    .foregroundColor(.black)
                                    .padding()
                                    .font(.largeTitle)
                            })
                        NavigationLink(
                            destination: About(),
                            label: {
                                Text("关于")
                                    .padding()
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            })
                    }
                    .navigationBarTitle(Text("艺术节评分系统"), displayMode: .inline)
                }
                Text("版本：0.0.1.210201_alpha（内部版本）")
                    .padding()
            }
        }
    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

