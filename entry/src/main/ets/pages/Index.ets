import { EventEmitter } from '@devzeng/eventemitter3';

const emitter: EventEmitter<string, Object> = new EventEmitter<string, Object>();

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  private onChanged = (data: Object) => {
    console.log('aaa:' + JSON.stringify(data))
  }

  aboutToAppear(): void {
    emitter.on("aaa", this.onChanged);
  }

  aboutToDisappear(): void {
    emitter.off("aaa", this.onChanged)
  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          emitter.emit("aaa", { "message": "aaaa"} );
        })
    }
    .height('100%')
    .width('100%')
  }
}