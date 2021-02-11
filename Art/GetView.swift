//
//  GetView.swift
//  Voting scoring system of Art Festival
//
//  Created by 刘佳航 on 2021/2/10.
//

import SwiftUI

struct GetView: View {
    var text = "true"
    //投票状态显示
    @State var text_toupiaozhuangtai = "未知"
    //投票原因显示
    @State var text_toupiaoyuanyin = "原因：无"
    @State var data = ""
    @State private var jokes: [Joke] = []
    @State var choose = ""
    @Environment(\.presentationMode) var presentation
    @State var play_data = "0"
    var body: some View {
        
        ZStack(alignment: .topLeading) {

                
                
        
            VStack(alignment: .center) {
                Text("当前选手")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                    .padding(.bottom , 5)
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width:35,height: 35)
                        .foregroundColor(.black)
                    VStack {
                        Text("谢佳露")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.secondary)
                        Text("初二年级")
                            .foregroundColor(.black)
                            .bold()
                            .font(.title3)
                    }
                }
                .frame(width:150,height: 55)
                Text("分数：")
                    .bold()
                    .foregroundColor(.black)
                    .background(Color.white)
                    .font(.title)
                Text(play_data)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .font(.title3)
                    .padding(.bottom , 10)
                KeyBoreds(player_data: $play_data)
                Text("请确认你的分数，本次提交后不可修改")
                    .font(.callout)
                    .bold()
                    .foregroundColor(.red)
                    .padding(.bottom ,10)
                Button(action: {
                    getJoke(value: play_data)
                    //processingData(value: self.data)
                }){
                        Text("提交")
                            .foregroundColor(.blue)
                            .bold()
                            .font(.title2)
                }
                .padding(.bottom ,10)
                
                VStack {
                    Text("投票状态：\(text_toupiaozhuangtai)")
                        .font(.body)
                        .bold()
                        .foregroundColor(.black)
                        .animation(.default)
                    Text(text_toupiaoyuanyin)
                        .font(.body)
                        .bold()
                        .foregroundColor(.black)
                        .animation(.easeIn)
                }
                .frame(width:200,height: 75)
                
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.backward.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 30,height: 30)
                        Text("返回")
                            .foregroundColor(.black)
                        
                    }
                        
                }
                
                

                
                
                
            }
        }
        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
    }
    func getJoke(value : String) {
        
        //var returnName = returnVarName
        let url = URL(string: "http://127.0.0.1:8080/acceptData?data=\(value)")!
        var urlRequest = URLRequest(url:url)
        urlRequest.addValue("", forHTTPHeaderField: "Get")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data,
                let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode,
                let strData = String(bytes: data, encoding: .utf8)
            {
                
                
                self.data = strData
                print(self.data)
                //print(strData)
                self.jokes.insert(Joke(joke: strData, status: 20), at: 0)
                if strData == text{
                    //print("false")
                    text_toupiaozhuangtai = "成功"
                    text_toupiaoyuanyin = ""
                }
                else{
                    //print("ture")
                    text_toupiaozhuangtai = "失败"
                    text_toupiaoyuanyin = "原因：数值过大"
                }
            }
            
        }.resume()
        
        
    }
    
    
}
#if DEBUG
struct GetView_Previews: PreviewProvider {
    static var previews: some View {
        GetView()
    }
}
#endif

struct KeyBoreds: View {
    @Binding var player_data : String
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Button(action: {
                    if player_data == "0"{
                        self.player_data = "1"
                    }
                    else{
                        self.player_data = "\(player_data)\(1)"
                    }
                }) {
                    Image(systemName: "1.circle")
                    
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                .background(Color.white)
                .cornerRadius(30)
                
                Button(action: {
                    if player_data == "0"{
                        self.player_data = "2"
                    }
                    else{
                        self.player_data = "\(player_data)\(2)"
                    }
                }) {
                    Image(systemName: "2.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                .background(Color.white)
                .cornerRadius(30)
                //.shadow(color:.secondary, radius: 20, x: 0, y: 20)
                
                
                Button(action: {
                    if player_data == "0"{
                        self.player_data = "3"
                    }
                    else{
                        self.player_data = "\(player_data)\(3)"
                    }
                }) {
                    Image(systemName: "3.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                .background(Color.white)
                .cornerRadius(30)
                //.shadow(color:.secondary, radius: 20, x: 0, y: 20)
                
            }
            HStack {
                Button(action: {
                    if player_data == "0"{
                        self.player_data = "4"
                    }
                    else{
                        self.player_data = "\(player_data)\(4)"
                    }
                }) {
                    Image(systemName: "4.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                .background(Color.white)
                .cornerRadius(30)
                //.shadow(color:.secondary, radius: 20, x: 0, y: 20)
                
                Button(action: {
                    if player_data == "0"{
                        self.player_data = "5"
                    }
                    else{
                        self.player_data = "\(player_data)\(5)"
                    }
                }) {
                    Image(systemName: "5.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                .background(Color.white)
                .cornerRadius(30)
                //.shadow(color:.secondary, radius: 20, x: 0, y: 20)
                
                Button(action: {
                    if player_data == "0"{
                        self.player_data = "6"
                    }
                    else{
                        self.player_data = "\(player_data)\(6)"
                    }
                }) {
                    Image(systemName: "6.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                .background(Color.white)
                .cornerRadius(30)
                //.shadow(color:.secondary, radius: 20, x: 0, y: 20)
                
            }
            HStack {
                Button(action: {
                    if player_data == "0"{
                        self.player_data = "7"
                    }
                    else{
                        self.player_data = "\(player_data)\(7)"
                    }
                }) {
                    Image(systemName: "7.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                .background(Color.white)
                .cornerRadius(30)
                //.shadow(color:.secondary, radius: 20, x: 0, y: 20)
                
                Button(action: {
                    if player_data == "0"{
                        self.player_data = "8"
                    }
                    else{
                        self.player_data = "\(player_data)\(8)"
                    }
                }) {
                    Image(systemName: "8.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                .background(Color.white)
                .cornerRadius(30)
                //.shadow(color:.secondary, radius: 20, x: 0, y: 20)
                
                Button(action: {
                    if player_data == "0"{
                        self.player_data = "9"
                    }
                    else{
                        self.player_data = "\(player_data)\(9)"
                    }
                }) {
                    Image(systemName: "9.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                .background(Color.white)
                .cornerRadius(30)
                //.shadow(color:.secondary, radius: 20, x: 0, y: 20)
            }
            HStack{
                Button(action: {
                    self.player_data = "\(player_data)\(".")"
                }){
                    Text(".")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                .background(Color.white)
                //.shadow(color:.secondary, radius: 20, x: 0, y: 20)
                .cornerRadius(30)
                
                Button(action: {
                    self.player_data = "\(player_data)\(0)"
                }) {
                    Image(systemName: "0.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                .background(Color.white)
                .cornerRadius(30)
                //.shadow(color:.secondary, radius: 20, x: 0, y: 20)
                
                Button(action: {
                    let number = self.player_data.count
                    if number - 1 == 0 {
                        self.player_data = "0"
                    }
                    else{
                        self.player_data = player_data.substring(to: player_data.index(before: player_data.endIndex))
                    }
                }) {
                    Image(systemName: "delete.left")
                    
                    
                    
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40 ,alignment: .center)
                .background(Color.white)
                .cornerRadius(30)
                //.shadow(color:.secondary, radius: 20, x: 0, y: 20)
            }
        }
        
    }
}

