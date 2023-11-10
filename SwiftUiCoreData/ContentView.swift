//
//  ContentView.swift
//  SwiftUiCoreData
//
//  Created by Neosoft on 09/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var fname : String = ""
    @State var lname : String = ""
    @State var isPresented = false
    @State var EmpData : [EmpData] = []
    @State var needrefresh : Bool = false
    
    let coreDm : DataBaseManager
    var body: some View {
        NavigationView {
            VStack {
                Text("Enter your Details")
                    .bold()
                    .font(.title2)
                HStack{
                    Text("fame :")
                    TextField("fname", text: $fname)
                        .textFieldStyle(.roundedBorder)
                }.padding(.horizontal)
                    .padding(.top)
                HStack{
                    Text("lame :")
                    TextField("lname", text: $lname)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal)
                Button {
                    coreDm.saveEmployeeData(fname:fname,lname: lname)
                    getEmpData()
                } label: {
                    Text("Save Details")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal,10)
                        .padding(.vertical,10)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                
                List{
                    ForEach(EmpData , id: \.self) { val in
                        
                        NavigationLink {
                            EmpDeatailsUpdateView(empData: val, codeDm: coreDm, needrefresh: $needrefresh)
                        } label: {
                            HStack{
                                Text(val.fname ?? "no val")
                                Text(val.lname ?? "no val")
                            }
                        }

//                        Button {
//                            isPresented.toggle()
//                        } label: {
//                            HStack{
//                                Text(val.fname ?? "no val")
//                                Text(val.lname ?? "no val")
//                            }
//                        }
                    }
                    .onDelete { indexset in
                        indexset.forEach { index in
                            let delmoviesref = EmpData[index]
                            coreDm.deleteEmpData(empdata: delmoviesref)
                            getEmpData()
                        }
                    }
                }
                .accentColor(needrefresh ? .white : .blue)
                .listStyle(InsetListStyle())
                .padding()
                .onAppear {
                    getEmpData()
                }
            }
            
        }
    }
    func getEmpData(){
        EmpData = coreDm.getAllData()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let empdata = EmpData()
        ContentView(coreDm: DataBaseManager.shared)
    }
}
