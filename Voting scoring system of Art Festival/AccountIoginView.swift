//
//  AccountIogin.swift
//  Voting scoring system of Art Festival
//
//  Created by 刘佳航 on 2021/2/2.
//

import SwiftUI

struct AccountIoginView: View {
    @State var Password = ""
    @State var Username = ""
    @State private var textOfPassword = ""
    @State private var textOfUsername = ""
    @State private var jokes: [Joke] = []
    @State var choose = 0
    @State var showFlag = false
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
                    self.Username = tempUsername
                    self.Password = tempPassword
                    text_of_view(uers: self.Username, pass: self.Password)
                }) {
                    HStack {
                        Image(systemName: "arrow.up.circle")
                            .foregroundColor(.secondary)
                            .frame(width:20,height: 20)
                        Text("登录")
                            .font(.title)
                            .foregroundColor(.secondary)
                            .frame(width:70,height: 40 ,alignment: .center)
                        Text(textOfUsername)
                            .font(.title2)
                            .foregroundColor(.black)
                        Text(textOfPassword)
                            .font(.title2)
                            .foregroundColor(.black)
                        
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
    
    func getJoke(requestUrlData : String,API_url : String,API_value :String) {
        
        let url = URL(string: "http://127.0.0.1:8080/\(API_url)?\(API_value)=\(requestUrlData)")!
        var urlRequest = URLRequest(url:url)
        urlRequest.addValue("", forHTTPHeaderField: "Appect")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data,
                let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode,
                let strData = String(bytes: data, encoding: .utf8)
            {
                textOfUsername = strData
                print(strData)
                //print(strData)
                self.jokes.insert(Joke(joke: strData, status: 20), at: 0)
            } }.resume()
        
    }
    
    func text_of_view(uers : String, pass: String){
        let username_password = "\(uers)and\(pass)"
        getJoke(requestUrlData: username_password, API_url: "setUsername", API_value: "setuserName")
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


