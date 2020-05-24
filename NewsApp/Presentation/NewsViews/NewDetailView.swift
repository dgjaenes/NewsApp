//
//  NewDetailView.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 24/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI
import SafariServices

struct NewDetailView: View {
    
    let viewModel: NewResultViewModel
    @State var showSafari = false
    
    init(viewModel: NewResultViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView([ .vertical ], showsIndicators: false)
        {
            HStack {
                VStack(alignment: .leading) {
                    if (viewModel.image != nil ) {
                        Image(uiImage: UIImage(data: viewModel.image!)!)
                            .resizable()
                            .frame(width: 180, height: 160)
                            .scaledToFit()
                            .cornerRadius(6)
                            .shadow(radius: 8)
                    } else {
                        Text("Not Image")
                    }
                }
                .padding(.leading, 8)
                
                VStack(alignment: .leading) {
                    Text(viewModel.title)
                        .font(.title)
                }
                .padding(.leading, 8)
                
                Spacer()
            }
            
            VStack(alignment: .center) {
                Text(viewModel.description)
                    .font(.footnote)
                    .lineLimit(2)
                    .padding(15)
            }
            .padding(8)
            
            Spacer()
                .padding(.top, 15)
            
            VStack() {
                Button("Ver en el navegador", action: {
                    self.showSafari = true
                })
                    .cornerRadius(9)
                .sheet(isPresented: $showSafari) {
                    SafariView(url:URL(string: self.viewModel.url)!)
                }
            }
            .frame(alignment: .trailing)
            .foregroundColor(Color.white)
            .background(Color(.black))
            .padding(20)
        }
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController,
                                context: UIViewControllerRepresentableContext<SafariView>) {

    }

}
