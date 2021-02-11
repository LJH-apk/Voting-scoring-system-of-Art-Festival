//
//  More.swift
//  ArtDay
//
//  Created by 刘佳航 on 2021/2/11.
//

import SwiftUI

struct More: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("特别鸣谢")
                .font(.title)
                .bold()
                .foregroundColor(.black)
            Text("艺术支持：谢佳露、许潇老师")
                .font(.callout)
                .bold()
                .foregroundColor(.secondary)
            Text("技术支持：")
                .font(.callout)
                .bold()
                .foregroundColor(.secondary)
            Text("参与内测的同学:")
                .font(.callout)
                .bold()
                .foregroundColor(.secondary)
            Text("IDE提供商：Apple Inc. Google JetBrains")
                .font(.callout)
                .bold()
                .foregroundColor(.secondary)
            Text("代码托管平台：Github Gitee")
                .font(.callout)
                .bold()
                .foregroundColor(.secondary)
            Text("服务器提供商：阿里巴巴")
                .font(.callout)
                .bold()
                .foregroundColor(.secondary)
               
            HStack {
                Image(systemName: "c.circle")
                    .foregroundColor(.secondary)
                    .frame(width:15,height:15)
                Text("2021刘佳航和袁仲泽保留一切权利")
                    .font(.callout)
                    .bold()
                    .foregroundColor(.secondary)
            }
            .padding(.bottom , 10)
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("返回")
                    .foregroundColor(.black)
                    .font(.title2)
            }
        }
    }
}

struct More_Previews: PreviewProvider {
    static var previews: some View {
        More()
    }
}
