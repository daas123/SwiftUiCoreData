//
//  EmpDeatailsUpdateView.swift
//  SwiftUiCoreData
//
//  Created by Neosoft on 09/11/23.
//

import SwiftUI

struct EmpDeatailsUpdateView: View {
   @State var empData : EmpData
   @State var codeDm : DataBaseManager
    @Binding var needrefresh : Bool
    @State var fname : String = ""
    @State var lname : String = ""
    var body: some View {
        VStack{
            HStack{
                Text("Fname :")
                TextField("\(empData.fname ?? "")", text: $fname)
                    .textFieldStyle(.roundedBorder)
            }
            HStack{
                Text("Fname :")
                TextField("\(empData.lname ?? "")", text: $lname)
                    .textFieldStyle(.roundedBorder)
            }
            
            Button {
                empData.fname = fname
                empData.lname = lname
                codeDm.updateEmpData()
                needrefresh.toggle()
                
            } label: {
                Text("Update")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal,10)
                    .padding(.vertical,10)
                    .foregroundColor(.white)
                    .background(.green)
                
                    
            }

        }.padding()
    }
}

struct EmpDeatailsUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        let empdata = EmpData()
        let coredata = DataBaseManager.shared
        EmpDeatailsUpdateView(empData: empdata, codeDm: coredata, needrefresh: .constant(false))
    }
}
