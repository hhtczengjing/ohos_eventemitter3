# ohos_eventemitter3

eventemitter3 for HarmonyOS.

## 安装

```shell
ohpm i @devzeng/eventemitter3
```

OpenHarmony ohpm 环境配置等更多内容，请参考[如何安装 OpenHarmony ohpm 包](https://ohpm.openharmony.cn/#/cn/help/downloadandinstall)

## 使用

```typescript
// 引用
import { EventEmitter } from '@devzeng/eventemitter3';

// 创建emitter
const emitter: EventEmitter<string, Object> = new EventEmitter<string, Object>();

// 声明监听的执行逻辑
private onEventChanged = (data: Object) => {
  console.log('aaa:' + JSON.stringify(data));
}

// 添加监听
emitter.on("event_name", this.onEventChanged);

// 移除监听
emitter.off("event_name", this.onEventChanged);

// 发送通知
emitter.emit("event_name", { "message": "消息内容"} );
```