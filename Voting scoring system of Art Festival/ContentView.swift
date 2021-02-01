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
            ZStack(alignment:.bottom) {//将版本号放置于主屏幕上方
                ZStack(alignment:.top) {
                    ZStack(alignment:.leading) {//将列表按钮放置在主屏幕之上
                        NavigationView {
                            VStack {
                                Text("艺术节评分系统")
                                    .bold()
                                    .font(.largeTitle)
                                    .foregroundColor(.secondary)
                                    .background(Color.white)
                                    .frame(width: 270, height: 120)
                                
                                NavigationLink(destination: Second()) {
                                    Text("进行评分")
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
                
                Text("版本：0.1.4.210201_alpha（内部版本）")
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

struct MenuRow : View{
    var image = "creditcard"
    var text = "My Account"
    var body: some View{
        return HStack {
            
//            Button(action: {
//                NavigationLink(destination:Second(),label:{
//                    Text(text)
//                        .foregroundColor(.black)
//                        .font(.body)
//                })
//            }) {
//
//
//            }
                VStack{
                        HStack {
                            Image(systemName: image)
                                .imageScale(.large)
                                .foregroundColor(.secondary)
                                .frame(width: 32, height: 32)
                            NavigationLink(
                                destination: Second(),
                                label: {
                                    Text(text)
                                        .foregroundColor(.black)
                                        .font(.body)
                            })
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
}

let MenuData = [
    Menu(name: "My Account", icon: "person.crop.square"),
    Menu(name: "Team", icon: "person.2"),
    Menu(name: "About", icon: "exclamationmark.circle"),
    Menu(name: "Help", icon: "lightbulb")
]


struct MenuView: View {
    var menuItems = ["My Account","Team","About"]
    var menu = MenuData
    @Binding var show : Bool
    var body: some View {
        VStack(alignment:.leading , spacing:20) {
            ForEach(menu){ item in
                MenuRow(image: item.icon , text: item.name)
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
    }
}
