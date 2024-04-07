import { ListView, RefreshController } from '@app/refresh'
import { Article, ArticleItem } from './Article'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/28
 * INTRODUCE:列表刷新
 * */
@Entry
@Component
struct ListViewPage {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<Article> = []

  aboutToAppear() {
   this.loadData()
  }
  loadData(){
    for (var i = 0; i < 10; i++) {
      this.array.push(new Article(this.array.length,`第${this.array.length}篇文章`,`第${this.array.length}篇文章的介绍`))
    }
  }
  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(item, index) {
    ArticleItem({article:item})
  }

  build() {
    Column() {
      ListView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        onRefresh: () => {
          //下拉刷新

          this.controller.finishRefresh()
        },
        onLoadMore: () => {
          //上拉加载
          this.loadData()
          setTimeout(()=>{
            this.controller.finishLoadMore()
          },1000)
        }
      })
    }
  }
}