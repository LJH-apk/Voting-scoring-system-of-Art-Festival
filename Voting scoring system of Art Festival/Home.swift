//
//  Home.swift
//  Voting scoring system of Art Festival
//
//  Created by 刘佳航 on 2021/2/1.
//

import SwiftUI

struct Home: View {
    
    @State var show = false
    var body: some View {
        ZStack {
            Button(action: { self.show.toggle()}) {
                Text("Open Menu")
                    .onTapGesture {
                        withAnimation(.linear(duration:0.5)){
                            self.show.toggle()
                        }
                        
                    }
            }
            
            MenuView(show: $show)
        }
        
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif

struct MenuRow2 : View{
    var image = "creditcard"
    var text = "My Account"
    var body: some View{
        return HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(.secondary)
                .frame(width: 32, height: 32)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}

struct Menu2 : Identifiable {
    var id = UUID()
    var name : String
    var icon : String
}

let MenuData2 = [
    Menu(name: "My Account", icon: "person.crop.square"),
    Menu(name: "Team", icon: "person.2"),
    Menu(name: "About", icon: "exclamationmark.circle"),
    Menu(name: "Help", icon: "lightbulb")
]


struct MenuView2: View {
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
        .padding(.top, 40)
        .padding(30)
        .frame(minWidth:0,maxWidth: .infinity,minHeight:0,maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(20.0)
        .padding(.trailing, 70)
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
