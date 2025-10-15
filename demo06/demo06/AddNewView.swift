//
//  AddNewView.swift
//  demo06
//
//  Created by 宋晓明 on 2025/9/28.
//

import SwiftUI

struct AddNewView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var backd: Bool = false
    @State private var fileName: String = ""
    var order: Int
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Name Your Note")
                    .bold()
                
                TextField("NewNote", text: $fileName)
                
                NavigationLink(destination: EditContent(fileName: fileName)) {
                    Text("Confirm")
                        .bold()
                }
                .onAppear(){
                    fileName = "NewFile_\(String(order+1))"
                    print("Creating new file \(fileName)")
                }
                .onDisappear(){
                    backd.toggle()
                    fileName = fileName.substring(start: 0, 15)
                    print("Back toggled")
                }
                .foregroundStyle(Color.orange)
                .opacity(0.8)
            }
            .onAppear(){
                if backd {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

#Preview {
    AddNewView(order: 0)
}

extension String {
    
    /// 截取字符串
    /// - Parameters:
    ///   - begin: 开始截取的索引
    ///   - count: 需要截取的个数
    /// - Returns: 字符串
    func substring(start: Int, _ count: Int) -> String {
        if(self.count <= count){
            return self
        }
        let begin = index(startIndex, offsetBy: max(0, start))
        let end = index(startIndex, offsetBy: min(count, start + count))
        return String(self[begin..<end])
    }
    
}
