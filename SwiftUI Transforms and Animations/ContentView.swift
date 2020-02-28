
import SwiftUI

struct ContentView : View {
    
    @State var expanded: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                CardView(title: "Walmart", color: .blue, borderColor: Color(hex: 0x8CADFA))
                    .offset(x: 0, y: expanded ? -300 : -40)
                    .scaleEffect(expanded ? 0.9 : 0.85)
                CardView(title: "Target", color: .red, borderColor: Color(hex: 0xFA8C8C))
                    .offset(x: 0, y: expanded ? -150 : -20)
                    .scaleEffect(expanded ? 0.95 : 0.90)
                CardView(title: " Card", color: .black, borderColor: Color(hex: 0xB3B3B3))
                    .onTapGesture {
                        self.expanded.toggle()
                    }
            }
            .offset(x: 0, y: expanded ? 150 : 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.05))
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color(.lightGray).opacity(0.4))
        .edgesIgnoringSafeArea(.all)
    }
}

struct CardView : View {
    
    let title: String
    let color: Color
    let borderColor: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .cornerRadius(10)
                .frame(width: 320, height: 210)
                .shadow(color: Color(.black).opacity(0.6), radius: 12)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(borderColor, lineWidth: 3)
                )
            Text(title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
    }
}

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
