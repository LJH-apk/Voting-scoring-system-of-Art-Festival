//
//  ContentView.swift
//  Voting scoring system of Art Festival
//
//  Created by 刘佳航 on 2021/2/1.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    var body: some View {
        
        HStack(alignment: .center) {
            ZStack(alignment:.top) {
                ZStack(alignment:.leading) {//将列表按钮放置在主屏幕之上
                    NavigationView {
                        VStack {
                            Text("艺术节投票系统")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(.secondary)
                                .background(Color.white)
                                .frame(width: 270, height: 120)
                            
                            NavigationLink(destination: Second()) {
                                Text("进入投票")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .frame(width: 170, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .shadow(color:.secondary, radius: 10, x: 5, y: 10)
                                    .cornerRadius(30)
                                
                            }
                            
                            .navigationBarTitle(Text(""), displayMode: .inline)
                        }
                        
                    }
                    
                    
                    MenuButton(show: $show)
                    
                    MenuView(show: $show)
                    
                }
                
                
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
    Menu(name: "关于", icon: "exclamationmark.circle",text:"Power by Apple.Inc"),
    Menu(name: "帮助", icon: "lightbulb",text:"请参考使用说明"),
    Menu(name: "版本", icon: "hammer",text:"0.1.4.210201_alpha")
]


struct MenuView: View {
    var menuItems = ["My Account","Team","About"]
    var menu = MenuData
    @Binding var show : Bool
    var body: some View {
        VStack(alignment:.leading , spacing:20) {
            ForEach(menu){ item in
                MenuRow(image: item.icon, name: item.name, text: item.text)
            }
            
            
            Spacer()
        }
        
        .padding(.top, 70)
        .padding(30)
        .frame(minWidth:0,maxWidth: .infinity,minHeight:0,maxHeight:.infinity)
        .background(Color.white)
        .cornerRadius(20.0)
        .padding(.trailing, 40)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees:show ? 0 : 60), axis: (x:0, y: 10.0, z: 0))
        .onTapGesture {
            withAnimation(.linear(duration:0.5)){
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
        .padding(.top,55)
        .padding(.trailing,10)
    }
}
