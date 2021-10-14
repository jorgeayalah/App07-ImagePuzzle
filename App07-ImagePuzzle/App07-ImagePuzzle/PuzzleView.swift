//
//  PuzzleView.swift
//  App07-ImagePuzzle
//
//  Created by A00828633 on 14/10/21.
//

import SwiftUI
import MobileCoreServices

struct PuzzleView: View {
    @StateObject var dataModel = DataModel()
    @State var isCompleted = true
    
    var columns : [GridItem] = Array(repeating: .init(.flexible(), spacing: 0), count: 4)
    
    var body: some View {
        GeometryReader{ geo in
            NavigationView{
                VStack{
                    Button {
                        isCompleted = false
                        dataModel.images.shuffle()
                    } label: {
                        HStack{
                            Image(systemName: "shuffle")
                                .font(.largeTitle)
                            Text("Shuffle")
                                .font(.largeTitle)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(10)
                        //.frame(width: 40, height: 15, alignment: .center)
                    }
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                    LazyVGrid(columns: columns, spacing: 0){ //New component that organizes in an amount cells the elements of a given array into a static grid
                        ForEach(dataModel.images) { image in
                            if isCompleted{
                                Image(image.image)
                                    .resizable()
                                    .frame(width: (geo.size.width-20)/4,
                                           height: (geo.size.width-20)/4)
                            }else{
                                Image(image.image)
                                    .resizable()
                                    .frame(width: (geo.size.width-20)/4,
                                           height: (geo.size.width-20)/4)
                                    .overlay(
                                        
                                        Rectangle()
                                            .stroke(Color.gray, lineWidth: isCompleted ? 0 : 1)
                                        
                                    )
                                    .onDrag{
                                        dataModel.currentImage = image
                                        return NSItemProvider(item: .some(URL(string:
                                                                                image.image)! as NSSecureCoding),
                                                              typeIdentifier: String(kUTTypeURL))
                                    }
                                    .onDrop(of: [.url], delegate: DropViewDelegate(image: image, dataModel: dataModel, isCompleted: $isCompleted))
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    Image(isCompleted ? "completedBobSponge" : "santacruz")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/2)
                        .padding(.top, 20)
                    //Spacer()
                }
                .navigationBarTitle("Puzzle")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct PuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView()
    }
}
