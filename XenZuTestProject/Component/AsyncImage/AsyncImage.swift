import SwiftUI

let DUMMY_IMG_URL = URL(string: "https://www.themoviedb.org/t/p/w220_and_h330_face/z8CExJekGrEThbpMXAmCFvvgoJR.jpg")!

private struct AsyncImage14<Placeholder: View>: View {
    public let url: URL

    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    private let configuration: (Image) -> Image

    public init(
        url: URL,
        cache: ImageCache? = nil,
        placeholder: Placeholder? = nil,
        configuration: @escaping (Image) -> Image = { $0 }
    ) {
        self.url = url
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: cache))
        self.placeholder = placeholder
        self.configuration = configuration
    }

    public var body: some View {
        ZStack {
            if loader.image != nil {
                configuration(imageView)
            } else {
                placeholder
            }
        }
        .onAppear(perform: loader.load)
        .onDisappear(perform: loader.cancel)
    }

    private var imageView: Image {
        Image(uiImage: loader.image ?? UIImage())
            .renderingMode(.original)
    }
}

public struct AsyncImage<Placeholder: View>: View {
    public let url: URL
    private let placeholder: Placeholder?
    private let configuration: (Image) -> Image

    @Environment(\.imageCache) var cache: ImageCache

    public init(
        url: URL,
        placeholder: Placeholder? = nil,
        configuration: @escaping (Image) -> Image = { $0 }
    ) {
        self.url = url
        self.placeholder = placeholder
        self.configuration = configuration
    }

    public var body: some View {
        AsyncImage14(
            url: url,
            cache: cache,
            placeholder: placeholder,
            configuration: configuration
        )
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(
            url: DUMMY_IMG_URL,
            placeholder: Text("Loading ..."),
            configuration: { $0.resizable() }
        )
        .scaledToFill()
        .frame(width: 104, height: 144)
        .clipped()
    }
}
