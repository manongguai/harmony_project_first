import { ArticleItem} from './Article'

@Entry
@Component
struct Index {
  @State message: string = 'Hello HarmonyOs'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Divider().margin('10 0')
        Button(){
          Text('点击切换').fontColor('#fff')
        }.onClick(()=>{
         this.message =  this.message === 'Hello World' ? 'Hello HarmonyOs' : 'Hello World'
        }).width(160).height(40)
      }
      .width('100%')
    }

    .height('100%')
  }
}