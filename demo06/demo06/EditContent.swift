//
//  EditContent.swift
//  demo06
//
//  Created by 宋晓明 on 2025/9/28.
//

import SwiftUI

struct EditContent: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var rowvalue: String = ""
    var fileName: String
    @State var contentRow : [String] = []
    @State var star: Bool = false
    var dataTools = DataTools.shared
    var notes = [NotesModel]()
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        Spacer()
                        HStack {
                            Text(fileName)
                                .bold()
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .font(.title2)
                                
                            if(star){
                                Image(systemName: "star.fill")
                                    .foregroundStyle(Color.orange)
                                    .padding()
                                    .opacity(0.9)
                                    .onTapGesture {
                                        star.toggle()
                                    }
                            }else{
                                Image(systemName: "star")
                                    .foregroundStyle(Color.orange)
                                    .padding()
                                    .opacity(0.9)
                                    .onTapGesture {
                                        star.toggle()
                                    }
                            }
                        }
                        Spacer().frame(height: 10)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 10)
                                .opacity(0.8)
                            Spacer()
                            VStack {
                                ForEach(contentRow.indices,id: \.self) { row in
                                    ZStack {
                                        Text(contentRow[row])
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                        
                                        Image(systemName: "minus.circle")
                                            .frame(maxWidth: .infinity,alignment: .trailing)
                                            .foregroundStyle(Color.red)
                                            .onTapGesture {
                                                contentRow.remove(at: row)
                                            }
                                    }
                                }
                            }
                        }
                        
                    }
                    
                    Spacer().frame(height: 10)
                    Divider()
                    Spacer().frame(height: 10)
                    TextField("New Row",text: $rowvalue)
                        .onSubmit {
                            contentRow.append(rowvalue)
                            rowvalue = ""
                        }
                    Spacer().frame(height: 10)
                    let date = Date()
                    let note1 = NotesModel(fileName: fileName, fileData: "", content: contentRow, date: date, star: star)
                    
                    Button("Save"){
                                if dataTools.find(item: note1){
                                    dataTools.update(item: note1)
                                }else{
                                    dataTools.insert(item: note1)
                                }
                                dataTools.DeveloperUse_Print()
                                self.presentationMode.wrappedValue.dismiss()
                            }.foregroundStyle(Color.orange)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                
                            if(dataTools.find(item: note1)){
                                Button("Delete"){
                                    dataTools.delete(item: note1)
                                    self.presentationMode.wrappedValue.dismiss()

                                }.foregroundStyle(Color.red)
                                    .opacity(0.8)
                            }
                }
            }
        }
    }
}

#Preview {
    EditContent(fileName: "")
}
