






import WidgetKit
import SwiftUI
import Intents
private let widgetGroupId = "group.anywheresoftware.b4a.SIAToolKit_home_widget_group"
// Define the data structure for your widget
struct Prayer: Decodable {
  let name: String
  let icon: String
  let time: String
}
struct SimpleEntry: TimelineEntry {
  let date: Date
  let hijri: String
  let month: String
  let event: String
  let prayers: [Prayer]
}
// Define the provider for your widget
struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(date: Date(), hijri: "N/A", month: "N/A", event: "N/A", prayers: [])
  }
  func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
    let entry = loadEntryFromUserDefaults()
    completion(entry)
  }
  func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
    let entry = loadEntryFromUserDefaults()
    let timeline = Timeline(entries: [entry], policy: .atEnd)
    completion(timeline)
  }
  private func loadEntryFromUserDefaults() -> SimpleEntry {
    let userDefaults = UserDefaults(suiteName: widgetGroupId)
    let data = userDefaults?.string(forKey: "data") ?? "{}"
    if let jsonData = data.data(using: .utf8) {
      do {
        let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
        let hijri = jsonObject?["hijri"] as? String ?? "N/A"
        let month = jsonObject?["month"] as? String ?? "N/A"
        let event = jsonObject?["event"] as? String ?? "N/A"
        if let prayersData = jsonObject?["prayers"] as? [[String: Any]] {
          let prayers = prayersData.compactMap { dict -> Prayer? in
            guard let name = dict["name"] as? String,
               let icon = dict["icon"] as? String,
               let time = dict["time"] as? String else { return nil }
            return Prayer(name: name, icon: icon, time: time)
          }
          return SimpleEntry(date: Date(), hijri: hijri, month: month, event: event, prayers: prayers)
        }
      } catch {
        print("Error decoding JSON: \(error)")
      }
    }
    return SimpleEntry(date: Date(), hijri: "N/A", month: "N/A", event: "N/A", prayers: [])
  }
}
// Define your widget view
struct iOSHomeWidgetEntryView: View {
  var entry: Provider.Entry
  var body: some View {
    VStack{
      ZStack {
//        Image("WidgetBackgroundImage")
//          .resizable()
//          .frame(width: UIScreen.main.bounds.size.width)
//          .scaledToFill()
        VStack (alignment: .leading){
            HStack {
                
                Text("\(entry.hijri) \(entry.month)")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
                Button {} label: {
                    
                    Image("covid-19-Article1")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFill()
                        
                }
            }
            entry.event == "" ? Text(" ").frame(maxWidth: .infinity, alignment: .leading) : Text(entry.event)
            .font(.subheadline)
            .foregroundColor(.black)
            .frame(alignment: .leading)
        }//.offset(x: 0, y: 20)
      }
      VStack(alignment: .leading) {
        HStack(spacing: 18){
          ForEach(entry.prayers, id: \.name) { prayer in
            VStack{
              Image(fileNameWithoutExtension(iconPath: prayer.icon))
                .resizable()
                .frame(width: 18, height: 18)
                .blendMode(.darken)
                .colorMultiply(Color(red: 94/255, green: 19/255, blue: 82/255))
              Text(prayer.name)
                .font(.custom("System", size: 11))
              Spacer()
              Text(timeSetting(time: prayer.time))
                .font(.custom("System", size: 9))
            }
          }
        }
      }
      .padding(.bottom, 20)
      .containerBackground(.black.opacity(0.01), for: .widget)
    }
  }
  func fileNameWithoutExtension(iconPath: String) -> String {
    let components = iconPath.split(separator: "/")
    let fileNameComponents = components.last?.split(separator: ".") ?? []
    let fileName = fileNameComponents.first.map(String.init) ?? ""
    return fileName
  }
  func timeSetting(time: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    let date = dateFormatter.date(from: time) ?? Date()
    dateFormatter.dateFormat = "hh:mm a"
    let formattedTime = dateFormatter.string(from: date)
    return formattedTime
  }
}
// Define your widget configuration
struct iOSHomeWidget: Widget {
  let kind: String = "iOSHomeWidget"
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      iOSHomeWidgetEntryView(entry: entry)
    }
    .supportedFamilies([.systemMedium])
    .configurationDisplayName("SIAT Widget")
    .description("This widget displays prayer times.")
  }
}
// Preview the widget
struct iOSHomeWidget_Previews: PreviewProvider {
  static var previews: some View {
    iOSHomeWidgetEntryView(entry: SimpleEntry(date: Date(), hijri: "1", month: "Muharram", event: "Event", prayers: [
      Prayer(name: "Fajr", icon: "sun_rise_set_icon", time: "05:23 AM"),
      Prayer(name: "Sunrise", icon: "sun_rise_set_icon", time: "12:15 PM"),
      Prayer(name: "Duhur", icon: "sun_icon", time: "12:15 PM"),
      Prayer(name: "Magrib", icon: "moon_icon", time: "12:15 PM"),
      Prayer(name: "Midnight", icon: "moon_star_icon", time: "12:15 PM")
    ]))
    .previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
//import WidgetKit
//import SwiftUI
//import Intents
//
//private let widgetGroupId = "group.anywheresoftware.b4a.SIAToolKit_home_widget_group"
//
//// Define your entry struct
//struct SimpleEntry: TimelineEntry {
//  let date: Date
//  let imageName: String?
//}
//
//// Define the provider for your widget
//struct Provider: TimelineProvider {
//  func placeholder(in context: Context) -> SimpleEntry {
//    SimpleEntry(date: Date(), imageName: "Star")
//  }
//
//  func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//    let data = UserDefaults.init(suiteName: widgetGroupId)
//    let image=data?.string(forKey: "data")
//    let entry = SimpleEntry(date: Date(), imageName: image)
//    completion(entry)
//  }
//
//  func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
//    getSnapshot(in: context) { (entry) in
//       let timeline = Timeline(entries: [entry], policy: .atEnd)
//       completion(timeline)
//      }
//  }
//
//  private func loadImagePathFromSharedContainer() -> String? {
//     let fileManager = FileManager.default
//     if let groupURL = fileManager.containerURL(forSecurityApplicationGroupIdentifier: widgetGroupId) {
//       let filePath = groupURL.appendingPathComponent("screenshot.png")
//       return filePath.path
//     }
//     return nil
//   }
//
//}
//
//// Define your widget view
//struct iOSHomeWidgetEntryView: View {
//  var entry: Provider.Entry
//
//  var body: some View {
//    Color.white
//      .edgesIgnoringSafeArea(.all)
//
//    if let imageName = entry.imageName, let uiImage = UIImage(named: imageName) {
//        Image(uiImage: uiImage)
//          .resizable()
//          .scaledToFill()
//          .padding(.horizontal, -20)
//          .padding(.top, -22)
//          .widgetURL(URL(string: "yourapp://")!)
//    } else {
//        Image("Star")
//          .resizable()
//          .scaledToFill()
//          .clipped()
//      }
//  }
//}
//
//// Define your widget configuration
//struct iOSHomeWidget: Widget {
//  let kind: String = "iOSHomeWidget"
//
//  var body: some WidgetConfiguration {
//    StaticConfiguration(kind: kind, provider: Provider()) { entry in
//      iOSHomeWidgetEntryView(entry: entry)
//        .containerBackground(.fill.opacity(0.0), for: .widget)
//    }
//    .configurationDisplayName("My Widget")
//    .description("This widget displays an image.")
//  }
//}
//
//// Preview the widget
//struct iOSHomeWidget_Previews: PreviewProvider {
//  static var previews: some View {
//      iOSHomeWidgetEntryView(entry: SimpleEntry(date: Date(), imageName: "Star"))
//        .previewContext(WidgetPreviewContext(family: .systemSmall))
//  }
//}
