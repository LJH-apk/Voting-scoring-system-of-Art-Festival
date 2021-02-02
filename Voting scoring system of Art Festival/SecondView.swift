//
//  Second.swift
//  Voting scoring system of Art Festival
//
//  Created by 刘佳航 on 2021/2/1.
//

import SwiftUI

struct SecondView: View {
    @State var state = false
    @State var Fraction = ""
    @State var tempFraction : String = ""
    @State var playerChoose = 0
    var player = PlayerNameData
    @Environment(\.presentationMode) var presentationMode
    @State private var isShow = false
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .foregroundColor(.white)
                    .onTapGesture(count: 1, perform: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
            }.edgesIgnoringSafeArea(.all)
            VStack {
                Text("当前选手")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom,-20)
                PlayerCard()
                TextField("请给出分数", text: $tempFraction)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.top,5)
                Button(action: {
                    withAnimation{
                        self.state.toggle()
                        self.Fraction = self.tempFraction
                    }
                }) {
                    Text("确认")
                        .foregroundColor(.black)
                        .font(.title2)
                        .bold()
                    Image(systemName: "checkmark.circle.fill")
                        .background(Color.black)
                        .foregroundColor(.white)
                }
                if state{
                    ProgressView()
                }
            }
            .frame(width:300,height: 30,alignment: .center)
            
        }
        
    }
}

struct Second_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

struct PlayerName : Identifiable{
    var id = UUID()
    var name : String               //参赛选手的名字
    var grade : String              //参赛选手的年级
    var tutorialClass : String      //参赛选手的导师班
}

let PlayerNameData = [
    PlayerName(name: "袁仲泽", grade: "初二年级", tutorialClass: "四班"),
    
    PlayerName(name: "刘佳航", grade: "初二年级", tutorialClass: "四班"),
    PlayerName(name: "谢佳露", grade: "初二年级", tutorialClass: "六班"),
    
    PlayerName(name: "曹知言", grade: "初二年级", tutorialClass: "六班")
    
]



struct PlayerCard: View {
    var name = "袁仲泽"
    var grade = "初二年级"
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width:30,height: 30)
            VStack {
                Text(name)
                    .font(.title)
                    .foregroundColor(.black)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text(grade)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
        .background(Color.white)
        .frame(width:200,height: 150)
        .cornerRadius(30)
    }
}
