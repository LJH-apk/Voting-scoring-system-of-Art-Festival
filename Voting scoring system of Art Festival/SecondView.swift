//
//  Second.swift
//  Voting scoring system of Art Festival
//
//  Created by 刘佳航 on 2021/2/1.
//

import SwiftUI


struct Joke: Codable,Identifiable{
    var id = UUID()
    var joke: String
    var status: Int
}

struct SecondView: View {
    @State var player_data = ""
    //@State var send_data : String = ""
    @State var textOfData = ""
    var link = "链接"
    @State var responseData = ""
    //@State var choose : Bool = false
    @State private var jokes: [Joke] = []
    @State var state = false
    //@State var Fraction : String = ""
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
                Text("分数：")
                    .font(.title)
                    .bold()
                Text(player_data)
                    .font(.callout)
                KeyBored(player_data: $player_data)
                Text("注意：分数不得大于10分，否则视为无效分数")
                    .font(.caption2)
                    .foregroundColor(.black)
                    .padding()
                Button(action: {
                    //                    self.send_data = Fraction
                    //                    self.getJoke(requestUrlData: send_data)
                    
                    
                }) {
                    //                    Link(self.link,
                    //                         destination: URL(string: "http://localhost:8080/setFractionPlayerOne?fractionPlayerOne=\(self.Fraction)")!)
                    Image(systemName: "checkmark.circle")
                        .background(Color.white)
                        .foregroundColor(.black)
                    Text("提交")
                        .bold()
                        .foregroundColor(.black)
                        .font(.title2)
                    
                }
                VStack {
                    Text(responseData)
                        .font(.title2)
                        .padding(.top,5)
                        .animation(.default)
                    Text(textOfData)
                        .font(.callout)
                        .padding(.top,10)
                        .animation(.linear)
                    
                }
                
                
                
                
                
                
            }
            .frame(width:300,height: 30,alignment: .center)
            
        }
        
    }
    
    
    func getJoke(requestUrlData : String) {
        
        
        let url = URL(string: "http://127.0.0.1:8080/setFractionPlayerOne?setFractionPlayerOne=\(requestUrlData)")!
        var urlRequest = URLRequest(url:url)
        urlRequest.addValue("", forHTTPHeaderField: "Get")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data,
               let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode,
               let strData = String(bytes: data, encoding: .utf8)
            {
                ReturnTextOfSever(text: strData)
                print(strData)
                //print(strData)
                self.jokes.insert(Joke(joke: strData, status: 20), at: 0)
            } }.resume()
        
    }
    //判断服务器返回的数据
    func toBool(text:String) -> String? {
        switch text {
        case "提交成功":
            return "提交成功"
        case "数值过大":
            return "数值过大"
        case "不是数字":
            return "不是数字"
        case "分数必须为正数":
            return "分数必须为正数"
        default:
            return nil
        }
    }
    
    func ReturnTextOfSever(text:String){
        if toBool(text: text) == "提交成功"{
            responseData = "提交成功!"
            textOfData = ""
        }
        else {
            responseData = "提交失败!"
            switch toBool(text: text) {
            case "数值过大":
                textOfData = "原因：\(text)"
            case "不是数字":
                textOfData = "原因：\(text)"
            case "分数必须为正数":
                textOfData = "原因：\(text)"
            default:
                textOfData = ""
            }
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

struct KeyBored: View {
    @Binding var player_data : String
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Button(action: {
                    self.player_data = "\(player_data)\(1)"
                }) {
                    Image(systemName: "1.circle")
                    
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                
                Button(action: {
                    self.player_data = "\(player_data)\(2)"
                }) {
                    Image(systemName: "2.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                Button(action: {
                    self.player_data = "\(player_data)\(3)"
                }) {
                    Image(systemName: "3.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
            }
            HStack {
                Button(action: {
                    self.player_data = "\(player_data)\(4)"
                }) {
                    Image(systemName: "4.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                Button(action: {
                    self.player_data = "\(player_data)\(5)"
                }) {
                    Image(systemName: "5.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                Button(action: {
                    self.player_data = "\(player_data)\(6)"
                }) {
                    Image(systemName: "6.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
            }
            HStack {
                Button(action: {
                    self.player_data = "\(player_data)\(7)"
                }) {
                    Image(systemName: "7.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                Button(action: {
                    self.player_data = "\(player_data)\(8)"
                }) {
                    Image(systemName: "8.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
                Button(action: {
                    self.player_data = "\(player_data)\(9)"
                }) {
                    Image(systemName: "9.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
            }
            HStack{
                Button(action: {
                    self.player_data = "\(player_data)\(0)"
                }) {
                    Image(systemName: "0.circle")
                }
                .padding(.all,8)
                .foregroundColor(.black)
                .frame(width:40,height: 40)
            }
            
            
            
            
        }
    }
}
