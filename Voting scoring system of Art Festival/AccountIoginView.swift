//
//  AccountIogin.swift
//  Voting scoring system of Art Festival
//
//  Created by 刘佳航 on 2021/2/2.
//

import SwiftUI

struct AccountIoginView: View {
    @State var choose = 0
    @State var showFlag = false
    @State var password:String = ""
    @State var username:String = ""
    @State var tempPassword : String = ""
    @State var tempUsername : String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment:.top) {
            VStack{
                Rectangle()
                    .foregroundColor(.white)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }.edgesIgnoringSafeArea(.all)
            VStack {
                Image("1-1")
                    .resizable()
                    .frame(width:200, height:100)
                    .padding(.top,50)
                TextField("请输入账号", text: $tempUsername)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.top,5)
                
                SecureField("请输入密码", text: $tempPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.top,10)
                
                
                Button(action: {
                    withAnimation{
                        self.showFlag.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: "arrow.up.circle")
                            .foregroundColor(.secondary)
                            .frame(width:20,height: 20)
                        Text("登录")
                            .font(.title)
                            .foregroundColor(.secondary)
                            .frame(width:70,height: 40 ,alignment: .center)
                        
                    }
                    
                    
                    .padding(.top,30)
                }
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                if showFlag{
                    ProgressView()
                }
                
//                Text(self.username)
//                Text(self.password)
                
                
            }
            .frame(width: 300, height: 520)
            
            
        }
    }
}

#if DEBUG
struct AccountIogin_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AccountIoginView()
        }
        
    }
}
#endif

    //var chooseImage:Int = 0;
    
