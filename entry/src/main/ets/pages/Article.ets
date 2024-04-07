

export class Article{
  public title:string
  public content:string
  public id:number

  constructor(id:number,title:string,content:string,) {
    this.id = id
    this.title = title
    this.content = content
  }
}

@Component
export struct ArticleItem {
  private article:Article
  build(){
    Row(){
        Image($r('app.media.icon')).width(80).height(80).margin({right:20})
        Column(){
          Text(this.article.title).fontSize(20).margin({bottom:8})
          Text(this.article.title).fontSize(16).fontColor(Color.Gray).margin({bottom:8})
        }.alignItems(HorizontalAlign.Start).width('90%').height('100%')
    }.padding(20).borderRadius(12).backgroundColor('#ffffffff').height(120).justifyContent(FlexAlign.SpaceBetween).border({
      width:1,
      color:Color.Gray,
      style:BorderStyle.Solid
    })
  }
}