
import SwiftUI

struct GridView: View {
    
    let defaultIcon = "square"
    let changedIcon = "star"
    let changeTime: CGFloat = 1
    
    @State var board = Array(repeating: Array(repeating: "square", count: 4),count:4)
    
    var body: some View{
        Grid {
            ForEach(0..<board.count) {
                row in
                GridRow {
                    ForEach(0..<board[row].count) {
                        col in
                        Image(systemName: board[row][col])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .onTapGesture {
                                board[row][col] = changedIcon
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + changeTime) {
                                    board[row][col] = defaultIcon
                                }
                            }
                    }
                }
            }
            .padding()
            
            
        }
    }
}
