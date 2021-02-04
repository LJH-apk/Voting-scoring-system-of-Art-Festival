//
//  ContentView.swift
//  Voting scoring system of Art Festival
//
//  Created by 刘佳航 on 2021/2/1.
//

import SwiftUI

struct ContentView: View {
    @State var AccounterName:String = "未登录"
    @State var show = false
    @State private var isPresented = false
    var body: some View {
        
        HStack(alignment: .center) {
            ZStack(alignment:.top) {
                ZStack(alignment:.top) {//控制屏幕中“进入打分”按钮的横坐标
                    VStack(alignment: .center) {
                        Text("艺术节打分系统")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.secondary)
                            .background(Color.white)
                            .frame(width: 270, height: 120)
                        
                        
                        
                        
                        Button("进入打分") {
                            self.isPresented = true
                        }.sheet(isPresented: $isPresented, content: {
                            SecondView()
                        })
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .frame(width:120, height: 40)
                        .font(.title)
                        .cornerRadius(30)
                        
//                        Text("Time: \(timeRemaining)")
//                            .background(
//                                Capsule()
//                                    .fill(Color.white)
//                                    .opacity(0.75)
//                            )
                        
                        
                    }
                    .padding(.top,60)
                    
                    
                    
                    VStack(alignment: .trailing) {
                        MenuButton(show: $show)
                            .frame(width: 60, height: 60)
                            .padding(.top, 5)
                        SigninButton(show: $show)
                        
                        
                        
                    }
                    
                    
                    
                    MenuView(AccounterName: $AccounterName, show: $show)
                    
                    
                    
                }
                
                
            }
            
        }
//        .onReceive(timer){ time in
//            if self.timeRemaining > 0{
//                self.timeRemaining -= 1
//            }
//        }
    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct MenuRow : View{
    var image = "creditcard"
    var name = "My Account"
    var text = ""
    var body: some View{
        return HStack {
            
            VStack{
                HStack {
                    Image(systemName: image)
                        .imageScale(.large)
                        .foregroundColor(.secondary)
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading) {
                        Text(name)
                            .foregroundColor(.black)
                            .font(.title3)
                            .bold()
                        Section {
                            Text(text)
                                .foregroundColor(.secondary)
                                .font(.headline)
                        }
                    }
                    
                    
                }
            }
            Spacer()
        }
    }
}

struct Menu : Identifiable {
    var id = UUID()
    var name : String
    var icon : String
    var text : String
}

let MenuData = [
    Menu(name: "开发团队", icon: "person.2" , text:"作者：刘佳航，袁仲泽"),
    Menu(name: "艺术指导", icon: "highlighter", text: "待定"),
    Menu(name: "关于", icon: "exclamationmark.circle",text:"Power by Apple Inc."),
    Menu(name: "帮助", icon: "lightbulb",text:"请参考使用说明"),
    Menu(name: "版本", icon: "hammer",text:"0.2.5.210204_alpha（内部版本）")
]

//侧边栏视图设置
struct MenuView: View {
    @State private var isPresented = false
    @Binding var AccounterName : String
    var menuItems = ["My Account","Team","About"]
    var menu = MenuData
    @Binding var show : Bool
    var body: some View {
        VStack(alignment:.leading , spacing:20) {
            HStack {
                Image(systemName: "person.crop.square")
                    .imageScale(.large)
                    .foregroundColor(.secondary)
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading) {
                    Text("账号")
                        .foregroundColor(.black)
                        .font(.title3)
                        .bold()
                    Section {
                        Text(self.AccounterName)
                            .foregroundColor(.secondary)
                            .font(.headline)
                    }
                }
                
                
            }
            ForEach(menu){ item in
                MenuRow(image: item.icon, name: item.name, text: item.text)
                
            }
            HStack {
                Image(systemName: "arrowtriangle.right.circle")
                    .imageScale(.large)
                    .foregroundColor(.secondary)
                    .frame(width: 40, height: 40)
                Button("登录") {
                    self.isPresented = true
                }.sheet(isPresented: $isPresented, content: {
                    AccountIoginView()
                })
                .foregroundColor(.black)
                .font(.title3)
            }
            
            
            
            Spacer()
        }
        
        .padding(.top, 70)
        .padding(10)
        .frame(minWidth:0,maxWidth: .infinity,minHeight:0,maxHeight:.infinity)
        .background(Color.white)
        .cornerRadius(30.0)
        .padding(.trailing, 40)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees:show ? 0 : 60), axis: (x:0, y: 20.0, z: 0))
        .onTapGesture {
            withAnimation(.linear(duration:0.2)){
                self.show.toggle()
            }
        }
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
    }
}

//侧边栏呼出按钮组件
struct MenuButton: View {
    @Binding var show : Bool
    var body: some View {
        ZStack{
            Button(action: {self.show.toggle()}){
                HStack(alignment: .center){
                    Image(systemName: "list.dash")
                        .foregroundColor(.black)
                        .onTapGesture {
                            withAnimation(.linear(duration:0.5)){
                                self.show.toggle()
                            }
                        }
                }
                .frame(width: 44, height: 44)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color:.secondary, radius: 20, x: 0, y: 20)
            }
            Spacer()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
        .padding(.trailing,10)
    }
}
//用户状态显示
struct SigninButton: View {
    @State private var isPage = false
    @Binding var show : Bool
    var body: some View {
        ZStack{
            Image(systemName: "person.crop.circle.badge.xmark")
                .frame(width:44,height: 44)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 50, x: 0, y: 20)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
        .padding(.trailing,10)
    }
}
