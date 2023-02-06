//
//  ContentView.swift
//  In-app modal sheet SwiftUI
//
//  Created by user on 2023/02/06.
//

import SwiftUI

struct ContentView: View {
    @State var isPresentedSubView = false
    
    var body: some View {
        VStack {
            Button("ボタン") {
                UIApplication.shared.open(URL(string: "https://www.apple.com")!)
            }
            Link("apple.comを開く", destination: URL(string: "https://www.apple.com")!)
 
            Button(action: {
                self.isPresentedSubView.toggle()
            }) {
                Text("モーダル画面を表示")
            }
            .sheet(isPresented: $isPresentedSubView) {
                SubView()
            }
        }
    }
    
}
struct SubView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            Text("LargeTitle Bold Primary - Lorem")
                .font(.largeTitle)
                .bold()
                .padding(.top, 70)
            Text("Body - Primary - Nam venenatis rhoncus tempus. Donec metus nibh, consequat non purus.")
                .font(.body)
                .padding(.top, 16)
            Text("Etiam rutrum imperdiet orci, et mattis ipsum sollicitudin vitae. Curabitur dapibus dui nec neque fermentum, ut dignissim ipsum iaculis.")
                .font(.body)
                .padding(.top, 16)
            
            Text("Integer odio ligula, rhoncus at iaculis id, porttitor sed quam. Vestibulum interdum risus non nulla luctus blandit. Quisque lacinia diam elit, sed efficitur lorem placerat ut. Quisque quis nulla lectus.")
                .font(.body)
                .padding(.top, 16)
            Text("Body - SystemBlue - ut sit amet arcu pellentesque, tincidunt arcu lobortis.")
                .font(.body)
                .foregroundColor(.blue)
            Button("Continue") {
                UIApplication.shared.open(URL(string: "https://www.apple.com")!)
            }.padding(.top, 24)
                .font(.headline)
                .frame(height: 50)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(14)

            Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
            }.padding(.top, 12)
                .font(.headline)
                .frame(height: 50)
                .padding(.bottom, 27)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(14)

        }
        .padding(24)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
